(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

fun
fact(x: int): int =
if x > 0 then x*fact(x-1) else 1

(* ****** ****** *)
//
// CPS-style (Continuation Passing)
//
fun
kfact
( x: int
, k0: (int) -<cloref1> int): int =
if
x = 0
then k0(1) // tail-call
else kfact(x-1, lam(res) => k0(x * res))
//
(* ****** ****** *)

val N = 3

(* ****** ****** *)
(*
val () =
println!
("fact(", N, ") = ", fact(N))
*)
//
val res =
kfact(N, lam(res) => res)
val () =
println!("kfact(", N, ") = ", res)
//
(* ****** ****** *)

fun
kfibo
( x: int
, k0: int -<cloref1> void): void =
if
(x < 2)
then k0(x)
else
kfibo
( x-1
, lam(r1) => kfibo(x-2, lam(r2) => k0(r1+r2)))

(* ****** ****** *)

(*
val () =
kfibo
( N
, lam(res) => println!("res*res = ", res*res))
*)

(* ****** ****** *)

fun
fact(x: int): int = fact2(x, 1)
and
fact2(x: int, acc: int): int =
if x > 0 then fact2(x-1, x*acc) else acc

(* ****** ****** *)

(*
val () =
println!("fact(", N, ") = ", fact(N))
*)

(* ****** ****** *)
val N2 = 1000000

fnx
isevn(x: int): bool =
if x = 0 then true else isodd(x-1)
and
isodd(x: int): bool =
if x = 0 then false else isevn(x-1)
(*
val () = println!("isevn(", N2, ") = ", isevn(N2))
*)
(* ****** ****** *)
(*
fun
kfact
( x: int
, k0: int -<cloref1> void): void = kfact2(x, 1, k0)
and
kfact2
( x: int
, acc: int
, k0: int -<cloref1> void): void =
(
  if x > 0 then kfact2(x-1, x*acc, k0) else k0(acc) 
)
*)
(* ****** ****** *)
(*
val () =
kfact
(N, lam(res) => println!("kfact(", N, ") = ", res))
*)
(* ****** ****** *)

(* end of [continuation.dats] *)
