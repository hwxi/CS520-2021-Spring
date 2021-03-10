
#include
"share/atspre_staload.hats"

//
// 0, 1, 1, 2, 3,
// 5, 8, 13, 21, 34, 55, ...
//
fun
fibo(x: int): int =
if x >= 2
then fibo(x-1) + fibo(x-2) else x

(*
val () =
println!("fibo(5) = ", fibo(5))
val () =
println!("fibo(10) = ", fibo(10))
*)

(*
val _ = fibo(~1)
// should cause a type-error but not
*)

(*
fun
fibo2(n: int): int =
loop(0, 0, 1) where { ... }
*)

(*
f(0) = 0 // R1
f(1) = 1 // R2
f(n) = f(n-1) + f(n-2) if for all n >= 2 // R3
*)

//
// FIBO(n, r) means f(n) = r
//
dataprop
FIBO(int, int) =
| R1(0, 0) of ()
| R2(1, 1) of ()
| 
{ n:int
| n >= 2}
{r1,r2:int}
R3(n, r1+r2) of (FIBO(n-1, r1), FIBO(n-2, r2))

(*
extern
fun
fibo: int -> int
*)
(*
extern
fun
fibo: int(n) -> (FIBO(n, r), int(r))
*)

fun
fibo
{ n : int
| n >= 0} // for every integer n
(x: int(n)): [r:int] (FIBO(n, r) | int(r)) =
if
x = 0
then (R1() | 0)
else
(
if
x = 1
then (R2() | 1)
else // x >= 2
(
let
val (pf1 | r1) = fibo(x-1)
val (pf2 | r2) = fibo(x-2)
in
  (R3(pf1, pf2) | r1 + r2)
end
)
)

(*
fun
fibo2
( x: int): int =
let
fun
loop
( y: int
// r0 = f(y)
, r0: int
// r1 = f(y+1)
, r1: int): int =
if y < x then loop(y+1, r1, r0+r1) else r0
in
  loop(0, 0, 1)
end
*)
//
// full correctness
//
fun
fibo2
{ n : int
| n >= 0} // for every integer n
(x: int(n)): [r:int] (FIBO(n, r) | int(r)) =
loop(R1(), R2() | 0, 0, 1) where
{
fun
loop
{ i:nat
| i <= n}
{r0,r1:int}
( pf0: FIBO(i, r0)
, pf1: FIBO(i+1, r1)
| y: int(i)
, r0: int(r0)
, r1: int(r1)): [r:int] (FIBO(n, r) | int(r)) =
if
y < x
then loop(pf1, R3(pf1, pf0)  | y+1, r1, r0+r1)
else (pf0 | r0)
}

//
// full correctness
//
fun
fibo2
{ n : int
| n >= 0} // for every integer n
(x: int(n)): [r:int] (FIBO(n, r) | int(r)) =
if
x = 0
then
(R1() | 0)
else
loop(R1(), R2() | 1, 0, 1) where
{
fun
loop
{ i:pos
| i <= n}
{r0,r1:int}
( pf0: FIBO(i-1, r0)
, pf1: FIBO(i+0, r1)
| y: int(i)
, r0: int(r0)
, r1: int(r1)): [r:int] (FIBO(n, r) | int(r)) =
if
y < x
then loop(pf1, R3(pf1, pf0)  | y+1, r1, r0+r1)
else (pf1 | r1)
}

implement
main0() =
{
#define N 10
val (_pf_ | r0) = fibo(N)
val () = println!("fibo(", N, ") = ", r0)
val (_pf_ | r0) = fibo2(N)
val () = println!("fibo2(", N, ") = ", r0)
}

(* ****** ****** *)

(* end of [fibo.dats] *)
