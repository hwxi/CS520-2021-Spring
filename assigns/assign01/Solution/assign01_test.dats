(* ****** ****** *)
(*
For testing assign01
*)
(* ****** ****** *)
(*
#include
"./../assign01.dats"
*)
#include
"./..\
/Solution/assign01_sol.dats"
(*
#include
"./..\
/MySolution/assign01_sol.dats"
*)
(* ****** ****** *)
//
val () =
println!
("Testing [int_test]:")
val () =
println!
("int_test() = ", int_test())
val () =
println!
( "sizeof(int) = "
, $extval(int, "sizeof(int)"))
//
val () =
if
( int_test()
= 8*$extval(int, "sizeof(int)"))
then
println!("Testing [int_test] passed!")
else
println!("Testing [int_test] failed!")
//
(* ****** ****** *)
//
val () =
println!
("Testing [ghaap/gheep]:")
//
val () =
if
(ghaap(3) = gheep(3))
then
println!("Testing [ghaap/gheep] passed!")
else
println!("Testing [ghaap/gheep] failed!")
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
print_intlist
(xs: intlist) =
(
case+ xs of
|
intlist_nil() => ()
|
intlist_cons(x0, xs) =>
(print(x0); print(';'); print_intlist(xs))
)

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
  (x1 != x2)
  then false
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
("Testing [intlist_append]:")
//
val () =
if
(  fromto(0, N1+N2) =
   intlist_append(xs1 , xs2)  )
then
println!("Testing [intlist_append] passed!")
else
println!("Testing [intlist_append] failed!")
//
(* ****** ****** *)
//
val () =
assertloc
( int_test()
= 8*$extval(int, "sizeof(int)")
)
val () =
assertloc
( ghaap(5) = gheep(5) )
val ( ) =
assertloc
(  fromto(0, N1+N2) =
   intlist_append(xs1 , xs2)  )
//
val () =
println!
("==============================")
val () =
println!
("All the tests have been passed!!!")
//
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign01_test.dats] *)
