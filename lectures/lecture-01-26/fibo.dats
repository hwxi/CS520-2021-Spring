(*
#include <stdio.h>
*)

#include
"share/atspre_staload.hats"

fun
fibo(x: int): int =
if x = 0 then 0 else
(if x = 1
 then 1 else fibo(x-2) + fibo(x-1))

#define N 10

implement
main0() =
println!("fibo(", N, ") = ", fibo(N))

(* ****** ****** *)

(* end of [fibo.dats] *)
