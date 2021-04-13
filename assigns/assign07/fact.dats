(* ****** ****** *)
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "MYFACT__dynload"
(* ****** ****** *)
%{$
const _ = MYFACT__dynload();
%} // for initialization
(* ****** ****** *)
#define
ATS_EXTERN_PREFIX "MYFACT__"
#define
ATS_STATIC_PREFIX "MYFACT__"
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib\
/libatscc2js/ATS2-0.3.2" // latest release
(* ****** ****** *)
#staload
UN = "prelude/SATS/unsafe.sats"
(* ****** ****** *)
#include
"{$LIBATSCC2JS}/staloadall.hats" // for prelude
(* ****** ****** *)
#staload
"{$LIBATSCC2JS}/SATS/print.sats" // for printing
(* ****** ****** *)
(*
#staload
"./../../mylib/SATS/mylib.sats"
#staload _ =
"./../../mylib/DATS/mylib.dats"
*)
(* ****** ****** *)
//
typedef int2 = $tup(int, int)
//
(* ****** ****** *)
extern
fun
fact_print_next(): void = "ext#%"
(* ****** ****** *)
//
extern
fun
fact_stream(): stream(int2)//="ext#%"//not used
//
implement
fact_stream() =
(
  auxmain(0, 1)) where
{
fun
auxmain
( x0: int
, r0: int): stream(int2) =
$delay
(stream_cons($tup(x0, r0), auxmain(x0+1, (x0+1)*r0)))
}
//
(* ****** ****** *)

local
//
val
facts =
ref{stream(int2)}(fact_stream())
//
in
implement
fact_print_next() =
let
val xrs = facts[]
in
case- !xrs of
|
stream_cons(xr0, xrs) =>
(facts[] := xrs; println!("fact(", xr0.0, ") = ", xr0.1))
end
end // end of [local]

(* ****** ****** *)

(* end of [fact.dats] *)
