/*
 * This file was generated by orbit-idl-2 - DO NOT EDIT!
 */

#include <string.h>
#define ORBIT2_STUBS_API
#include "add-two-ints.h"

void AddApp_Add_addTwoInts(AddApp_Add _obj, const CORBA_short input_a, const CORBA_short input_b, CORBA_Environment *ev){
gpointer _args[2];
_args[0] = (gpointer)&input_a;
_args[1] = (gpointer)&input_b;
ORBit_c_stub_invoke (_obj, &AddApp_Add__iinterface.methods, 0, NULL, _args, NULL, ev, AddApp_Add__classid, G_STRUCT_OFFSET (POA_AddApp_Add__epv, addTwoInts),
(ORBitSmallSkeleton) _ORBIT_skel_small_AddApp_Add_addTwoInts);

}
