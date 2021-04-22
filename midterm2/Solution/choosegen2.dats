(* ****** ****** *)
// HX: 20 points
(* ****** ****** *)
#staload "./../midterm2.dats"
(* ****** ****** *)
#staload
"./../../mylib/SATS/mylib.sats"
#staload
"./../../mylib/DATS/mylib.dats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)
implement(a)
fprint_val<mylist(a)> = fprint_mylist
(* ****** ****** *)
(*
//
// HX: 20 points
//
extern
fun
choosegen2
{m,n:nat | m >= n}
(m: int(m), n: int(n)):
[r:int]
(CHOOSE(m, n, r) | mylist1(mylist1(int, n), r))
//
*)
(* ****** ****** *)
//
// Given two natural numbers m >= n,
//
// choosegen(m, n) returns a list of all the combinations formed using
// n numbers among 0, 1, ..., m-1
//
// For instance, choosegen(5, 3) contains the following 10 combinations:
// (0, 1, 2), (0, 1, 3), (0, 1, 4), (0, 2, 3), (0, 2, 4),
// (0, 3, 4), (1, 2, 3), (1, 2, 4), (1, 3, 4), (2, 3, 4)
//
// Note that (0, 1, 2) and all its permutations are considered the same
// combination and only one (preferably the smallest one) should be listed.
//
(* ****** ****** *)

(* end of [choosegen2.dats] *)
