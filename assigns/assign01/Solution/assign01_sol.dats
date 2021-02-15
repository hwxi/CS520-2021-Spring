(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

#include "./../assign01.dats"

(* ****** ****** *)

// Please write your code below:

(* ****** ****** *)

implement
int_test() =
loop(1, 0) where
{
fun
loop
(i: int, n: int): int =
if i = 0 then n else loop(i+i, n+1)
}

(* ****** ****** *)
//
implement
gheep(n) =
if
n = 0
then 1
else
loop(1, 1, 2) where
{
fun
loop
(i: int, r0: int, r1: int): int =
if i < n then loop(i+1, r1, (i+1)*r0*r1) else r1
}
//
(* ****** ****** *)

implement
intlist_append 
(xs, ys) =
rappend(reverse(xs), ys) where
{
fun
reverse
(xs: intlist): intlist = rappend(xs, intlist_nil())
and
rappend
( xs: intlist
, ys: intlist): intlist =
(
case+ xs of
| intlist_nil() => ys
| intlist_cons(x0, xs) => rappend(xs, intlist_cons(x0, ys))
)
} (*where*) // end of [intlist_append]

(* ****** ****** *)

(* end of [assign01_sol.dats] *)
