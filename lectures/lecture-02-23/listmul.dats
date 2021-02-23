(* ****** ****** *)
#include
"share/atspre_staload.hats"
#staload
"./../../mylib/SATS/mylib.sats"
(* ****** ****** *)

extern
fun
listmul0(xs: mylist(int)): int

implement
listmul0(xs) =
(
case+ xs of
| mylist_nil() => 1
| mylist_cons(x0, xs) => x0 * listmul0(xs)
)

(* ****** ****** *)

extern
fun
listmul1(xs: mylist(int)): int

implement
listmul1(xs) =
(
case+ xs of
| mylist_nil() => 1
| mylist_cons(x0, xs) =>
  if x0 = 0 then 0 else x0 * listmul1(xs)
)

fun
fromto
(i: int, j: int): mylist(int) =
loop(j, mylist_nil()) where
{
fun
loop(j: int, res: mylist(int)): mylist(int) =
  if j > i then loop(j-1, mylist_cons(j-1, res)) else res
}

(* ****** ****** *)

extern
fun
listmul2(xs: mylist(int)): int

implement
listmul2(xs) =
let

exception ZeroExn of ()

fun
helper(xs: mylist(int)): int =
case+ xs of
| mylist_nil() => 1
| mylist_cons(x0, xs) =>
  if
  (x0 = 0)
  then $raise ZeroExn() else x0 * helper(xs)
  
in
  try helper(xs) with ~ZeroExn() => 0 (*| exn => $raise(exn)*)
end

(* ****** ****** *)

#define N 10

implement
main0() =
let
val xs = mylist_cons(0, fromto(1, N))
in
  println!("listmul2(xs) = ", listmul2(xs))
end

(* ****** ****** *)

(* end of [listmul.dats] *)
