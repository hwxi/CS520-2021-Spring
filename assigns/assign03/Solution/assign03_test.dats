(* ****** ****** *)
(*
For testing assign03
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../..\
/mylib/SATS/mylib.sats"
#staload _ =
"./../../..\
/mylib/DATS/mylib.dats"
(* ****** ****** *)
//
#staload "./../assign03.dats"
//
(* ****** ****** *)
// (*
#staload
"./..\
/MySolution/assign03_sol.dats"
// *)
(* ****** ****** *)

#define N 100

(* ****** ****** *)

val
ln2 = stream_ln2()

(* ****** ****** *)

val ( ) =
loop(0) where
{
fun
loop
(i: Nat): void =
if
(i < N)
then
loop(i+1) where
{
val () =
println!
("ln2[", i, "] = ", stream_get_at_exn(ln2, i))
}
}

(* ****** ****** *)

val
ijs = intpair_enumerate()

(* ****** ****** *)

val ( ) =
loop(0) where
{
fun
loop
(n: Nat): void =
if
(n < N)
then
loop(n+1) where
{
val
(i, j) =
stream_get_at_exn(ijs, n)
val () =
println!
("ijs[", n, "] = (", i, ", ", j, ")")
}
}

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign03_test.dats] *)
