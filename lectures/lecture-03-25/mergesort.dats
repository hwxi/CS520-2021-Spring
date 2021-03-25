(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

datatype
mylist1(a:t@ype, int) =
|
mylist1_nil(a, 0) of ()
|
{n:nat}
mylist1_cons(a, n+1) of (a, mylist1(a, n))

(* ****** ****** *)
extern
prfun
{a:t@ype}
lemma_mylist1
{n:int}(mylist1(a, n)): [n >= 0] void
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist1_mergesort
{n:int}
( xs: mylist1(a, n)
, cmp: (a, a) -<cloref1> int): mylist1(a, n)
//
(* ****** ****** *)

implement
{a}
mylist1_mergesort
  (xs, cmp) =
(
  msort(xs)) where
{
//
fun
merge
{m,n:int}
( xs: mylist1(a, m)
, ys: mylist1(a, n)): mylist1(a,m+n) =
(
case+ xs of
|
mylist1_nil() => ys
|
mylist1_cons(x1, xs2) =>
(
case+ ys of
|
mylist1_nil() => xs
|
mylist1_cons(y1, ys2) =>
if
cmp(x1, y1) <= 0
then mylist1_cons(x1, merge(xs2, ys))
else mylist1_cons(y1, merge(xs, ys2))
)
)
//
fun
split
{n0:int}
(xs: mylist1(a, n0)):
[n1,n2:nat|n1+n2==n0]
(mylist1(a, n1), mylist1(a, n2)) =
(
case+ xs of
| mylist1_nil() =>
  (mylist1_nil(), mylist1_nil())
| mylist1_cons(x0, mylist1_nil()) =>
  ( mylist1_nil()
  , mylist1_cons(x0, mylist1_nil()))
| mylist1_cons(x1, mylist1_cons(x2, xs)) =>
  let
    val (ys, zs) = split(xs)
  in
    (mylist1_cons(x1, ys), mylist1_cons(x2, zs))
  end
)
//
fun
msort
{n:int}
( xs
: mylist1(a, n)): mylist1(a, n) =
(
case+ xs of
|
mylist1_nil() => xs
|
mylist1_cons
(_, mylist1_nil()) => xs
| _ (* |xs| >= 2 *) =>
let
val
(ys, zs) = split(xs) in merge(msort(ys), msort(zs))
end
)
} (* end of [mylist1_mergesort] *)

(* ****** ****** *)
////
implement
{a}
mylist_mergesort
  (xs, cmp) =
(
  msort(xs)) where
{
//
fun
merge
( xs: mylist(a)
, ys: mylist(a)): mylist(a) =
(
case+ xs of
|
mylist_nil() => ys
|
mylist_cons(x1, xs2) =>
(
case+ ys of
|
mylist_nil() => xs
|
mylist_cons(y1, ys2) =>
if
cmp(x1, y1) <= 0
then mylist_cons(x1, merge(xs2, ys))
else mylist_cons(y1, merge(xs, ys2))
)
)
//
fun
split
(xs: mylist(a)):
(mylist(a), mylist(a)) =
(
case+ xs of
| mylist_nil() =>
  (mylist_nil(), mylist_nil())
| mylist_cons(x0, mylist_nil()) =>
  ( mylist_nil()
  , mylist_cons(x0, mylist_nil()))
| mylist_cons(x1, mylist_cons(x2, xs)) =>
  let
    val (ys, zs) = split(xs)
  in
    (mylist_cons(x1, ys), mylist_cons(x2, zs))
  end
)
//
fun
msort
( xs
: mylist(a)): mylist(a) =
(
case+ xs of
|
mylist_nil() => xs
|
mylist_cons
(_, mylist_nil()) => xs
| _ (* |xs| >= 2 *) =>
let
val
(ys, zs) = split(xs) in merge(msort(ys), msort(zs))
end
)
} (* end of [mylist_mergesort] *)

(* ****** ****** *)
