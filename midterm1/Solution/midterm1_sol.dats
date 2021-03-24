
#include
"share/atspre_staload.hats"
#staload
"./../../mylib/SATS/mylib.sats"
#staload _ =
"./../../mylib/DATS/mylib.dats"

#staload "./../midterm1.dats"

(* ****** ****** *)
(*
extern
fun
{a:t@ype}
mystrm_enumerate
(xss: mystrm(mystrm(a))): mystrm(a)
*)
(* ****** ****** *)
//
implement
{a}
mystrm_enumerate
(xss) =
(
let
fun
helper
(
xss:
mystrm
(mystrm(a))): mystrm(a) =
$delay
(
case !xss of
|
stream_nil() =>
stream_nil()
|
stream_cons(xs1, xss) =>
(
case+ !xs1 of
| stream_nil() => !(helper(xss))
| stream_cons(x1, xs1) =>
  stream_cons(x1, alter(xs1, helper(xss)))
)
)
in
  helper(xss)
end
) where
{
fun
alter
( xs: mystrm(a)
, ys: mystrm(a)): mystrm(a) =
$delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x1, xs) => 
  stream_cons(x1, alter(ys, xs))
)
}
//
(* ****** ****** *)
//
(*
extern
fun
{a:t@ype}
list2mytrees
(xs: mylist(a)): mylist(mytree(a))
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_splits
( xs
: mylist(a))
: mylist
  (@(mylist(a), mylist(a)))
//
implement
{a}
mylist_splits
  (xs) =
(
  splits(xs)
) where
{
fun
splits
( xs
: mylist(a))
: mylist
  (@(mylist(a), mylist(a))) =
(
case+ xs of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons
(x1, xs) =>
let
val res = splits(xs)
in
mylist_cons
(
(mylist_sing(x1), xs)
,
mylist_map
( res
, lam(rr) => (mylist_cons(x1, rr.0), rr.1))
)
end // end of [splits]
)
} (* end of [mylist_splits] *)
//
(* ****** ****** *)
(*
//
// This one is in mylib
//
extern
fun
{a:t@ype}
{b:t@ype}
mylist_xprod2
( xs: mylist(a)
, ys: mylist(b)): mylist(@(a, b))
//
*)
(* ****** ****** *)
//
implement
{a}
list2mytrees
  (xs) =
(
case+ xs of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons
(x1, tl) =>
(
case+ tl of
|
mylist_nil() =>
mylist_sing(mytree_sing(x1))
|
mylist_cons _ =>
mylist_concat
(
mylist_map
( mylist_splits(xs)
, lam(xx) => helper(xx.0, xx.1))
)
)
) where
{
fun
helper
( xs
: mylist(a)
, ys
: mylist(a))
: mylist(mytree(a)) =
(
case+ ys of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons _ =>
let
val
res1 = list2mytrees<a>(xs)
val
res2 = list2mytrees<a>(ys)
in
mylist_map
( mylist_xprod2(res1, res2)
, lam(tt) => mytree_pair(tt.0, tt.1))
end
) (* end of [helper] *)
} (*where*) // end of [list2mytrees]
//
(* ****** ****** *)

(*
extern
fun
mylist_submaxord
(xs: mylist(int)): mylist(int)
*)

implement
mylist_submaxord
(xs) =
(
case+ xs of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons(x1, xs) =>
let
//
val
xs1 = xs
val
ys1 =
mylist_submaxord(xs1)
//
val
xs2 =
mylist_filter
( xs
, lam(x2) => (x1 <= x2))
//
val ys2 =
mylist_cons
(x1, mylist_submaxord(xs2))
//
in
if
mylist_length(ys1)
>
mylist_length(ys2) then ys1 else ys2
end
) (* end of [mylist_submaxord] *)

(* ****** ****** *)

(*
extern
fun
mylist_maxdrawdown(xs: mylist(double)): (int, int)
//
// Note that a segment is represented as a pair where
// the two integers are the indices of the first and
// last elements of the segment.
*)

(* ****** ****** *)

(* end of [midterm1_sol.dats] *)
