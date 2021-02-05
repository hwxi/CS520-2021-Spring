(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
#staload "./../assign02.dats"
(* ****** ****** *)

#staload
"./../../../mylib/SATS/mylib.sats"
#staload _ =
"./../../../mylib/DATS/mylib.dats"
(* ****** ****** *)
//
// HX: dummy code
//
implement
{a}(*tmp*)
mylist_append(xs, ys) = mylist_nil()
//
(* ****** ****** *)
//
// HX: dummy code
//
implement
{a}(*tmp*)
mylist_rappend(xs, ys) = mylist_nil()
//
(* ****** ****** *)

implement
{a}(*tmp*)
matrix_validate(M) = false // dummy code
implement
{a}(*tmp*)
matrix_transpose(M) = ( M ) // dummy code


(* ****** ****** *)

(* end of [assign02_sol.dats] *)
