#include
"share/atspre_staload.hats"

datatype
intlist =
| intlist_nil of () // (0)
  // con intlist_nil(): intlist
| intlist_cons of (int, intlist) // (1, xs, xs)
  // con intlist_cons(x0: int, xs: intlist): intlist

(*
fun
length(xs: intlist): int =
if
intlist_is_empty(xs)
then 0
else 1 + length(intlist_tail(xs))
*)

fun
length(xs: intlist): int =
(
case xs of
| intlist_nil() => 0//pattern-matching clause
| intlist_cons(head, tail) => 1 + length(tail)
)

fun
length2(xs: intlist): int =
(
  loop(xs, 0)
) where
{
  fun
  loop(xs: intlist, ln: int): int =
  case xs of
  | intlist_nil() => ln
  | intlist_cons(_, xs) => loop(xs, 1 + ln)
}

fun
reverse
( xs
: intlist): intlist =
(
  loop(xs, intlist_nil())
) where
{
  fun
  loop
  (xs: intlist, ys: intlist): intlist =
  (
  case+ xs of
  | intlist_nil() => ys
  | intlist_cons(hd, tl) => loop(tl, intlist_cons(hd, ys))
  )
}