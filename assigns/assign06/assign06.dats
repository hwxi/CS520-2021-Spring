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
mylist1_cons
( a, n+1 ) of (a, mylist1(a, n))

(* ****** ****** *)

typedef
mylist1
(a:t@ype) = [n:nat] mylist1(a, n)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_mylist1
(xs: mylist1(a)): void
extern
fun
{a:t@ype}
fprint_mylist1
(out: FILEref, xs: mylist1(a)): void
//
overload print with print_mylist1
overload fprint with fprint_mylist1
//
(* ****** ****** *)

implement
{a}
print_mylist1(xs) =
fprint_mylist1(stdout_ref, xs)
implement
{a}
fprint_mylist1(out, xs) =
(
fprint_mylist<a>
( stdout_ref, $UNSAFE.cast(xs) )
)

(* ****** ****** *)

datatype
ralist1(a:t@ype, int) =
|
ralist1_nil(a, 0) of ()
|
{n:pos}
ralist1_evn(a, n+n) of
(ralist1(a, n), ralist1(a, n))
|
{n:nat}
ralist1_odd(a, n+n+1) of
(a, ralist1(a, n), ralist1(a, n))

(* ****** ****** *)
extern
prfun
{a:t@ype}
lemma_ralist1
{n:int}
(ralist1(a, n)): [n >= 0] void
(* ****** ****** *)

extern
fun
{a:t@ype}
ralist1_isnil
{n:int}
(ralist1(a, n)): bool(n==0)

implement
{a}
ralist1_isnil
  (xs) =
(
case+ xs of
| ralist1_nil() => true
| _ (* else *) =>> false
)

(* ****** ****** *)

extern
fun
{a:t@ype}
ralist1_sing
{n:int}
( x0: a ): ralist1(a, 1)

implement
{a}
ralist1_sing(x0) =
ralist1_odd
(x0, ralist1_nil(), ralist1_nil())

(* ****** ****** *)

extern
fun
{a:t@ype}
ralist1_cons
{n:int}
( x0: a
, xs: ralist1(a, n)): ralist1(a, n+1)

extern
fun
{a:t@ype}
ralist1_uncons
{n:pos}
(xs: ralist1(a, n)): (a, ralist1(a, n-1))

(* ****** ****** *)

implement
{a}
ralist1_cons(x0, xs) =
(
case+ xs of
|
ralist1_nil() => ralist1_sing(x0)
|
ralist1_evn(xs1, xs2) => ralist1_odd(x0, xs1, xs2)
|
ralist1_odd(x1, xs1, xs2) =>
ralist1_evn(ralist1_cons(x0, xs1), ralist1_cons(x1, xs2))
)

(* ****** ****** *)

implement
{a}
ralist1_uncons(xs) =
(
case+ xs of
(*
|
ralist1_nil() => ...
*)
|
ralist1_evn(xs1, xs2) =>
let
//
val
(x1, xs1) =
ralist1_uncons(xs1)
val
(x2, xs2) =
ralist1_uncons(xs2)
//
in
(x1, ralist1_odd(x2, xs1, xs2))
end
|
ralist1_odd(x1, xs1, xs2) =>
(
case+ xs1 of
| ralist1_nil() => (x1, ralist1_nil())
| _(*non-nil*) =>> (x1, ralist1_evn(xs1, xs2))
)
) (* end of [ralist1_uncons] *)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
ralist1_to_mylist1
{n:int}
(xs: ralist1(a, n)): mylist1(a, n)
//
implement
{a}
ralist1_to_mylist1
( xs ) =
(
auxmain(xs)) where
{
//
fun
alter
{n:int}
( xs
: mylist1(a, n)
, ys
: mylist1(a, n))
: mylist1(a, n+n) =
(
case+ xs of
|
mylist1_nil() => ys
|
mylist1_cons(x1, xs) =>
(
case+ ys of
|
mylist1_cons(y1, ys) =>
mylist1_cons
(x1, mylist1_cons(y1, alter(xs, ys)))
)
)
//
fun
auxmain
{n:int}
( xs
: ralist1(a, n)
)
: mylist1(a, n) =
(
case+ xs of
|
ralist1_nil() =>
mylist1_nil()
|
ralist1_evn(xs1, xs2) =>
alter(auxmain(xs1), auxmain(xs2))
|
ralist1_odd(x0, xs1, xs2) =>
mylist1_cons
(x0, alter(auxmain(xs1), auxmain(xs2)))
)
//
} (* end of [ralist1_to_mylist1] *)
//
(* ****** ****** *)

typedef
ralist1
(a:t@ype) = [n:nat] ralist1(a, n)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_ralist1
(xs: ralist1(a)): void
extern
fun
{a:t@ype}
fprint_ralist1
(out: FILEref, xs: ralist1(a)): void
//
overload print with print_ralist1
overload fprint with fprint_ralist1
//
(* ****** ****** *)
extern
fun
{a:t@ype}
mylist1_to_ralist1
{n:int}
(xs: mylist1(a, n)): ralist1(a, n)
(* ****** ****** *)
implement
{a}
mylist1_to_ralist1
( xs ) =
(
auxmain(xs)) where
{
fun
auxmain
{n:int}
( xs
: mylist1(a, n)
)
: ralist1(a, n) =
case+ xs of
| mylist1_nil() =>
  ralist1_nil()
| mylist1_cons(x1, xs) =>
  ralist1_cons( x1, auxmain(xs) )
}
(* ****** ****** *)

implement
{a}
print_ralist1(xs) =
fprint_ralist1(stdout_ref, xs)
implement
{a}
fprint_ralist1(out, xs) =
(
fprint_mylist1
(stdout_ref, ralist1_to_mylist1<a>(xs))
)

(* ****** ****** *)
//
// HX: 10 points
//
(* ****** ****** *)
//
(*
Please give an implemenation
of the following length function
that is O(log(n))-time:
*)
//
extern
fun
{a:t@ype}
ralist1_length
{n:int}
(xs: ralist1(a, n)): int(n)
//
(* ****** ****** *)
//
// HX: 10 points
//
(* ****** ****** *)
//
(*
Please give an implemenation
of the following list-map function
that is of O(n)-time complexity:
*)
//
extern
fun
{a:t@ype}
{b:t@ype}
ralist1_map
{n:int}
( xs: ralist1(a, n)
, f0: (a) -<cloref1> b): ralist1(b, n)

(* ****** ****** *)
//
typedef
fmatrix
( a:t@ype
, m:int, n:int) =
(
  ralist1(ralist1(a, n), m)
)
//
(* ****** ****** *)
//
(*
HX: 30 points
Please give an implementation of
(functional) matrix multiplication:
*)
(* ****** ****** *)
//
extern
fun
fmatrix_mul
{p,q,r:int}
( A: fmatrix(double, p, q)
, B: fmatrix(double, q, r)): fmatrix(double, p, r)
//
(* ****** ****** *)

(* end of [assign06.dats] *)
