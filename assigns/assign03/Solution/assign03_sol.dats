(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
#staload "./../assign03.dats"
(* ****** ****** *)

#staload
"./../../../mylib/SATS/mylib.sats"
#staload _ =
"./../../../mylib/DATS/mylib.dats"
(* ****** ****** *)
//
implement
{}(*tmp*) // this is dummy code
stream_ln2() = stream_make_nil()
//
(* ****** ****** *)
//
implement
{}(*tmp*) // this is dummy code
intpair_enumerate() = stream_make_nil()
//
(* ****** ****** *)
//
// HX: dummy code
//
implement
{}(*tmp*)
EulerTrans(xs) = xs // this is dummy code
//
(* ****** ****** *)

(* end of [assign03_sol.dats] *)
