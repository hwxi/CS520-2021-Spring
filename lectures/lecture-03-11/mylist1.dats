(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/SATS/mylib.sats"
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
lemma_mylist1
{a
:t@ype}
{n:int}(xs: mylist1(a, n)): [n >= 0] void

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_length
{n:int}
(xs: mylist1(a, n)): int(n)

(* ****** ****** *)

implement
{a}
mylist1_length(xs) =
(
length(xs)
) where
{
fun
length
{n:int}
(xs: mylist1(a, n)): int(n) =
(
case+ xs of
| mylist1_nil() => 0
| mylist1_cons(_, xs) => 1 + length(xs)
)
}

(* ****** ****** *)

implement
{a}
mylist1_length(xs) =
(
loop(xs, 0)
) where
{
fun
loop
{i:int}
{j:nat}
( xs
: mylist1(a, i)
, j: int(j)): int(i+j) =
(
case+ xs of
| mylist1_nil() => j
| mylist1_cons(_, xs) => loop(xs, j+1)
)
}

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_append
{m,n:int}
( xs: mylist1(a, m)
, ys: mylist1(a, n)): mylist1(a, m+n)

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_reverse
{m:int}
( xs: mylist1(a, m)): mylist1(a, m)
extern
fun
{a:t@ype}
mylist1_rappend
{m,n:int}
( xs: mylist1(a, m)
, ys: mylist1(a, n)): mylist1(a, m+n)

(* ****** ****** *)

implement
{a}
mylist1_append
  (xs, ys) =
let
val xs =
mylist1_reverse<a>(xs)
in
  mylist1_rappend<a>(xs, ys)
end

(* ****** ****** *)

implement
{a:t@ype}
mylist1_reverse(xs) =
mylist1_rappend<a>(xs, mylist1_nil{a}())

(* ****** ****** *)

implement
{a}
mylist1_rappend(xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
{m,n:int}
( xs: mylist1(a, m)
, ys: mylist1(a, n)): mylist1(a, m+n) =
let
prval () = lemma_mylist1(ys)
in
case+ xs of
| mylist1_nil() => ys
| mylist1_cons(x1, xs) => loop(xs, mylist1_cons(x1, ys))
end
}

(* ****** ****** *)

extern
fun
{a:t@ype}
{b:t@ype}
mylist1_map
{n:int}
( xs: mylist1(a, n)
, f0: (a) -<cloref1> b): mylist1(b, n)
extern
fun
{a:t@ype}
{b:t@ype}
mylist1_maprev
{n:int}
( xs: mylist1(a, n)
, f0: (a) -<cloref1> b): mylist1(b, n)

(* ****** ****** *)

implement
{a}{b}
mylist1_map
(xs, f0) =
mylist1_reverse<b>
(mylist1_maprev<a><b>(xs, f0))

implement
{a}{b}
mylist1_maprev
(xs, f0) =
loop(xs, mylist1_nil()) where
{
fun
loop
{i:int}
{j:int}
( xs: mylist1(a, i)
, ys: mylist1(b, j)): mylist1(b, i+j) =
(
let
prval () = lemma_mylist1(ys)
in
case+ xs of
| mylist1_nil() => ys
| mylist1_cons(x0, xs) =>
  loop(xs, mylist1_cons(f0(x0), ys))
end
)
} (* end of [mylist1_maprev] *)

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_mergesort
{n:int}
( xs: mylist1(a, n)
, cmp: (a, a) -<cloref1> int): mylist1(a, n)

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
, ys: mylist1(a, n)): mylist1(a, m+n) =
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
{m:int}
(xs: mylist1(a, m)):
[n1,n2:nat | m==n1+n2]
(mylist1(a,n1), mylist1(a,n2)) =
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

implement main0() = ()

(* ****** ****** *)

val xs =
mylist1_nil()
val xs =
mylist1_cons{int}(1, xs)
val xs =
mylist1_cons{int}(2, xs)
val xs =
mylist1_cons{int}(3, xs)

(* ****** ****** *)

val () = println!
("mylist1_length(xs) = ", mylist1_length<int>(xs))

(* ****** ****** *)

(* end of [mylist1.dats] *)
