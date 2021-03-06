;; make servo module
(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 15 60 15))
    (send b1 :locate #f(0 20 0))
    ;;(setq b2 (make-cylinder 3 60))
    ;;(send b2 :locate #f(0 0 -30))
    ;;(setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-hinji nil
  (let ((b2 (make-cube 20 46 20)) 
        (b1 (make-cube 15 48 15)))
    (send b2 :locate #f(0 -2 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :y))
;; instance cascaded coords                                                                                                                                              
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

;; draw objects                                                                                                                                                          
(objects (list r))

;; make servo move                                                                                                                                                       
(setq i 0)
(do-until-key
  (send r :angle-vector (float-vector (* 9 (sin (/ i 10.0)))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  (setq i (+ i 1))


