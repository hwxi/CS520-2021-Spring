(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

#staload
"./../../mylib/SATS/mylib.sats"
#staload _ =
"./../../mylib/DATS/mylib.dats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

datatype
mylist1(a:t@ype, int) =
|
mylist1_nil(a, 0) of ()
|
{n:nat}
mylist1_cons
( a, n+1 ) of (a, mylist1(a, n))

extern
prfun
lemma_mylist1
{a:t@ype}
{n:int}
(mylist1(a, n)): [n >= 0] void

(* ****** ****** *)

typedef
mylist1
(a:t@ype) = [n:nat] mylist1(a, n)

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_append
{m,n:int}
( mylist1(a, m)
, mylist1(a, n)): mylist1(a, m+n)
implement
{a}
mylist1_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
//
prval () = lemma_mylist1(xs)
prval () = lemma_mylist1(ys)
//
fun
append
{m,n:nat}
( xs
: mylist1(a, m)
, ys
: mylist1(a, n)): mylist1(a, m+n) =
(
case+ xs of
| mylist1_nil() => ys
| mylist1_cons(x1, xs) =>
  mylist1_cons(x1, append(xs, ys))
)
//
} (*where*) // end of [mylist1_append]

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_quicksort
{n:int}
( xs: mylist1(a, n)
, cmp: (a, a) -<cloref1> int): mylist1(a, n)

(* ****** ****** *)

implement
{a}
mylist1_quicksort(xs, cmp) =
let

fun
qsort
{n:int}
(xs: mylist1(a, n)): mylist1(a, n) =
(
case+ xs of
|
mylist1_nil() =>
mylist1_nil()
|
mylist1_cons(x0, xs) =>
let
prval () = lemma_mylist1(xs)
in
partition
(x0, xs, mylist1_nil(), mylist1_nil())
end
)
and
partition
{p,q,r:nat}
( x0: a
, xs: mylist1(a, p)
, ys: mylist1(a, q)
, zs: mylist1(a, r)): mylist1(a, p+q+r+1) =
(
case+ xs of
|
mylist1_nil() =>
let
val ys = qsort(ys)
val zs = qsort(zs)
in
mylist1_append(ys, mylist1_cons(x0, zs))
end
|
mylist1_cons(x1, xs) =>
let
val sgn = cmp(x1, x0)
in
if
(sgn <= 0)
then
partition(x0, xs, mylist1_cons(x1, ys), zs)
else
partition(x0, xs, ys, mylist1_cons(x1, zs))
end
)
in
  qsort(xs)
end // end of [mylist1_quicksort]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_mylist1(mylist1(a)): void
overload print with print_mylist1
//
implement
{a}
print_mylist1(xs) =
print($UNSAFE.cast{mylist(a)}(xs))
//
(* ****** ****** *)

val xs = mylist1_nil{int}()
val xs = mylist1_cons(1, xs)
val xs = mylist1_cons(2, xs)
val xs = mylist1_cons(3, xs)
val xs = mylist1_cons(4, xs)
val xs = mylist1_cons(5, xs)
val xs = mylist1_cons(6, xs)
val xs = mylist1_cons(4, xs)
val xs = mylist1_cons(5, xs)
val xs = mylist1_cons(6, xs)
val xs = mylist1_cons(4, xs)
val xs = mylist1_cons(5, xs)
val xs = mylist1_cons(6, xs)
val () = println!("xs = ", xs)
val ys = mylist1_quicksort<int>(xs, lam(x1, x2) => compare(x1, x2))
val () = println!("ys = ", ys)
val ys = mylist1_quicksort<int>(ys, lam(x1, x2) => ~compare(x1, x2))
val () = println!("ys = ", ys)

(* ****** ****** *)

(* end of [quicksort.dats] *)


