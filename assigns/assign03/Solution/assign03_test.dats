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

#define N0 10
#define N1 100

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
(i < N0)
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
(n < N1)
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
//
val ln2_0 = ln2
//
(* ****** ****** *)
//
val ln2_1 =
EulerTrans(ln2_0)
val ( ) =
loop(0) where
{
fun
loop
(i: Nat): void =
if
(i < N0)
then
loop(i+1) where
{
val () =
println!
("ln2_1[", i, "] = ", stream_get_at_exn(ln2_1, i))
}
}
//
(* ****** ****** *)
//
val ln2_2 =
EulerTrans(ln2_1)
val ( ) =
loop(0) where
{
fun
loop
(i: Nat): void =
if
(i < N0)
then
loop(i+1) where
{
val () =
println!
("ln2_2[", i, "] = ", stream_get_at_exn(ln2_2, i))
}
}
//
(* ****** ****** *)
//
val ln2_3 =
EulerTrans(ln2_2)
val ( ) =
loop(0) where
{
fun
loop
(i: Nat): void =
if
(i < N0)
then
loop(i+1) where
{
val () =
println!
("ln2_3[", i, "] = ", stream_get_at_exn(ln2_3, i))
}
}
//
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign03_test.dats] *)
