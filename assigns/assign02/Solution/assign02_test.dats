(* ****** ****** *)
(*
For testing assign02
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../..\
/mylib/SATS/mylib.sats"
(* ****** ****** *)
//
#staload "./../assign02.dats"
//
(* ****** ****** *)
(*
#staload
"./..\
/MySolution/assign02_sol.dats"
*)
(* ****** ****** *)

val xs =
mylist_nil{string}()
val xs = mylist_cons("5", xs)
val xs = mylist_cons("4", xs)
val xs = mylist_cons("3", xs)
val xs = mylist_cons("2", xs)
val xs = mylist_cons("1", xs)
val xs = mylist_cons("0", xs)

val ys =
mylist_reverse<string>(xs)
val zs =
mylist_reverse<string>(ys)

(* ****** ****** *)
val () = assertloc(xs = zs)
(* ****** ****** *)
val () =
assertloc
(
mylist_append<string>(mylist_append<string>(xs, ys), zs)
=
mylist_append<string>(xs, mylist_append<string>(ys, zs))
)
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign02_test.dats] *)
