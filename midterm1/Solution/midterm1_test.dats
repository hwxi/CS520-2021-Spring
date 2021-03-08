(* ****** ****** *)
(*
For testing midterm1
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../..\
/mylib/SATS/mylib.sats"
#staload _ =
"./../..\
/mylib/DATS/mylib.dats"
(* ****** ****** *)
//
#staload "./../midterm1.dats"
//
(* ****** ****** *)
exception LastPermException of ()
(* ****** ****** *)
//
(*
#staload
*)
#include
"./..\
/MySolution/midterm1_sol.dats"
//
(* ****** ****** *)

val _ =
{
val xs =
mylist_cons{int}
(
4
,
mylist_cons{int}
(
2
,
mylist_cons{int}
(
3
,
mylist_cons
{int}(1, mylist_nil()))))
val () = println!("xs = ", xs)
val () = println!
( "sort(xs) = "
, mylist_mergesort
  (xs, lam(x1, x2) => compare(x1, x2)))
}

(* ****** ****** *)

val _Q1_ =
{
// no test for it
}

(* ****** ****** *)

val _Q2_ =
{
val
xs0 =
mylist_nil()
val _ =
list2mytrees<int>(xs0)
}

(* ****** ****** *)

val _Q3_ =
{
val
xs0 =
mylist_nil()
val _ =
mylist_submaxord(xs0)
}

(* ****** ****** *)

val _Q4_ =
{
val
xs0 =
mylist_nil()
val _ =
mylist_maxdrawdown(xs0)
}

(* ****** ****** *)

val _Q5_ =
{
val
xs0 =
mylist_nil()
val _ =
try
permute_next(xs0)
with
| ~LastPermException() => xs0
}

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_test.dats] *)
