(*
#include <stdio.h>
*)

#include
"share/atspre_staload.hats"

(*
fun
fibo(x: int): int =
if x = 0 then 0 else
(if x = 1
 then 1 else fibo(x-2) + fibo(x-1))
*)

fun
fibo2(x: int): int =
let
//
fun
loop
( i: int
, res0: int
, res1: int): int =
if
(i < x)
then
loop(i+1, res1, res0 + res1) // tail-recurive
else res0
//
in
  loop(0, 0(*res0*), 1(*res1*))
end

#define N 1000000

implement
main0() =
println!("fibo2(", N, ") = ", fibo2(N))

(* ****** ****** *)

(* end of [fibo2.dats] *)