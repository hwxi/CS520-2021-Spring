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

datatype
ralist(a:t@ype, int) =
|
ralist_nil(a, 0) of ()
|
{n:pos}
ralist_evn(a, n+n) of (ralist(a, n), ralist(a, n))
|
{n:nat}
ralist_odd(a, n+n+1) of (a, ralist(a, n), ralist(a, n))

(* ****** ****** *)

(*
evn( evn(odd(1, nil, nil), odd(2, nil, nil))
   , evn(odd(3, nil, nil), odd(4, nil, nil)))
evn([1, 2], [3, 4]): 1, 3, 2, 4 // alternately
odd(0, [1, 2], [3, 4]): 0, 1, 3, 2, 4 // alternately
*)

(* ****** ****** *)
extern
prfun
{a:t@ype}
lemma_ralist
{n:int}
(ralist(a, n)): [n >= 0] void
(* ****** ****** *)

extern
fun
{a:t@ype}
ralist2mylist1
{n:int}
(xs: ralist(a, n)): mylist1(a, n)

(* ****** ****** *)

extern
fun
{a:t@ype}
ralist_isnil
{n:int}
(ralist(a, n)): bool(n==0)

implement
{a}
ralist_isnil
  (xs) =
(
case+ xs of
| ralist_nil() => true
| _ (* else *) =>> false
)

(* ****** ****** *)

extern
fun
{a:t@ype}
ralist_sing
{n:int}
( x0: a ): ralist(a, 1)

implement
{a}
ralist_sing(x0) =
ralist_odd
(x0, ralist_nil(), ralist_nil())

(* ****** ****** *)

extern
fun
{a:t@ype}
ralist_cons
{n:int}
( x0: a
, xs: ralist(a, n)): ralist(a, n+1)

extern
fun
{a:t@ype}
ralist_uncons
{n:pos}
(xs: ralist(a, n)): (a, ralist(a, n-1))

(* ****** ****** *)

implement
{a}
ralist_cons(x0, xs) =
(
case+ xs of
|
ralist_nil() => ralist_sing(x0)
|
ralist_evn(xs1, xs2) => ralist_odd(x0, xs1, xs2)
|
ralist_odd(x1, xs1, xs2) =>
ralist_evn(ralist_cons(x0, xs1), ralist_cons(x1, xs2))
)

(* ****** ****** *)

implement
{a}
ralist_uncons(xs) =
(
case+ xs of
(*
|
ralist_nil() => ...
*)
|
ralist_evn(xs1, xs2) =>
let
//
val
(x1, xs1) =
ralist_uncons(xs1)
val
(x2, xs2) =
ralist_uncons(xs2)
//
in
(x1, ralist_odd(x2, xs1, xs2))
end
|
ralist_odd(x1, xs1, xs2) =>
(
case+ xs1 of
| ralist_nil() => (x1, ralist_nil())
| _(*non-nil*) =>> (x1, ralist_evn(xs1, xs2))
)
) (* end of [ralist_uncons] *)

(* ****** ****** *)

(* end of [ralist.dats] *)
