;; P26

(load "output_macro.l")

;; (car (x (cdr '(a (b c) d))))
(output
 (car (car (cdr '(a (b c) d))))
 )

;; (x 13 (/ 1 0)
;; 13
(output
  (or 13 (/ 1 0))
  )

;; (x #'list 1 nil)
;; (1)
(output
  (apply #'list 1 nil)
  )

;; 正の整数を引数とし, その数のピリオドを表示する
(defun print-period (num)
    (dotimes (i num)
      (format t "."))
    (format t "~%")
    )

(output
 (print-period 5)
 )

(defun print-period-rec (num)
  (if (<= num 0) (format t "~%")
    (progn (format t ".")
           (print-period-rec (- num 1))
           )))

(output
 (print-period-rec 5)
 )

;; 一つのリストを引数とし, aというシンボルがいくつあるか返す.
(setq lst (list 'a 'b 'test 'a 't 'a 'test))
;; iteration
(defun n-a-symbol-iter (lst)
  (setq cnt 0)
  (dolist (itm lst)
    ; (print (eq itm 'a))
    (if (eq itm 'a)
      (setq cnt (+ cnt 1))
      )
    )
  cnt
  )
(format t "~%number of lst is: ~A." (n-a-symbol-iter lst))
;; recurrence
(defun n-a-symbol-recur (lst cnt)
  (if lst
    (if (eq (car lst) 'a)
      (n-a-symbol-recur (cdr lst) (+ cnt 1))
      (n-a-symbol-recur (cdr lst) cnt)
      )
    cnt
    )
  )
(format t "~%number of lst is: ~A." (n-a-symbol-recur lst 0))

;; nilでない要素の合計を書こうとしたが..
; 1)
(setq lst (list 1 nil 2 nil 3 4 nil 5 6))
(defun summit (lst)
  ; (remove nil lst) ; remove
  (setq lst (remove nil lst)) ; add
  (apply #'+ lst))
(format t "~%sum of lst is ~A." (summit lst))

(defun summit (lst)
  (apply #'+ (remove nil lst))
  )

; 2)
(defun summit2 (lst)
  (if (null lst) ; add
    0            ; add
    (let ((x (car lst)))
      (if (null x)
        (summit (cdr lst))
        (+ x (summit (cdr lst)))
        )
      )
    )            ; add
  )
(format t "~%sum of lst is ~A." (summit2 lst))

(defun summit2 (lst)
  (if lst
      (+ (or (car lst) 0) (summit (cdr lst)))
    0))
