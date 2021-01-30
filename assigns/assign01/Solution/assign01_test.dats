(*
For testing assign01
*)

(* ****** ****** *)

#include
"./..\
/MySolution/assign01_sol.dats"

(* ****** ****** *)
//
val () =
println!
("Testing [int_test]!")
val () =
assertloc
(int_test() =
 $extval(int, "sizeof(int)"))
//
(* ****** ****** *)
//
val () =
println!
("Testing [ghaap/gheep]!")
val () =
assertloc(ghaap(3) = gheep(3))
//
(* ****** ****** *)

fun
fromto
( n1: int
, n2: int): intlist =
(
loop(n2, intlist_nil())
) where
{
fun
loop
( n2: int
, res: intlist): intlist =
if n2 > n1
then
loop
( n2 - 1
, intlist_cons(n2-1, res)) else res
}

(* ****** ****** *)

fun
intlist_equal
( xs1: intlist
, xs2: intlist): bool =
(
case+ (xs1, xs2) of
|
( intlist_nil()
, intlist_nil() ) => true
|
( intlist_cons(x1, xs1)
, intlist_cons(x2, xs2)) =>
  if
  (x1 = x2)
  then true
  else intlist_equal(xs1, xs2)
| ( _(*else*) , _(*else*) ) => false
)
#symload = with intlist_equal

(* ****** ****** *)
//
#define N1 10000000
#define N2 1
//
val xs1 = fromto(0, N1)
val xs2 = fromto(N1, N1+N2)
val ( ) =
println!
("Testing [intlist_append]!")
val ( ) =
assertloc
(  fromto(0, N1+N2) =
   intlist_append(xs1, xs2)  )
//
(* ****** ****** *)

implement main0() = { (*nothing*) }

(* ****** ****** *)

(* end of [assign01_test.dats] *)
