(* ****** ****** *)
#staload
"./../mylib/SATS/mylib.sats"
(* ****** ****** *)
//
extern
fun{}
f91(x: int): int
implement
f91<>(x) =
if x > 100
then x - 10 else f91(f91(x+11))
//
(*
// HX: 10 points
Please CPS-translate f91 into kf91
*)
//
extern
fun
kf91
( x: int
, k0: (int) -<cloref1> void): void
//
(* ****** ****** *)
datatype
braunt(a:t@ype, int) =
|
braunt_nil(a, 0) of () 
|
{nl,nr:nat
| nr <= nl
; nl <= nr+1}
braunt_node
(a, nl+nr+1) of
(a, braunt(a, nl), braunt(a, nr))
(* ****** ****** *)
typedef
braunt
(a:t@ype) = [n:int] braunt(a, n)
(* ****** ****** *)
extern
prfun
lemma_braunt
{a
:t@ype}
{n:int}
(xs: braunt(a, n)): [n >= 0] void
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_sing(x0: a): braunt(a, 1)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_cons
{n:int}
( x0: a
, t0: braunt(a, n)): braunt(a, n+1)
extern
fun
{a:t@ype}
braunt_uncons
{n:int|n > 0}
( t0
: braunt(a, n)): (a, braunt(a, n-1))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_braun(t0: braunt(a)): void
extern
fun
{a:t@ype}
fprint_braun
(out: FILEref, t0: braunt(a)): void
//
(* ****** ****** *)
overload
print with print_braun
overload
fprint with fprint_braun
(* ****** ****** *)
implement
{a}
print_braun(xs) =
fprint_braun(stdout_ref, xs)
implement
{a}
fprint_braun(out, xs) =
(
  loop(0, xs)) where
{
  fun
  loop
  (i0: int, xs: braunt(a)): void =
  (
  case+ xs of
  | braunt_nil() => ()
  | braunt_node _ =>
    let
      val
      (x0, xs) = braunt_uncons<a>(xs)
    in
      if
      (i0 > 0)
      then fprint(out, ";");
      fprint_val<a>(out, x0); loop(i0+1, xs)
    end
  )
}
(* ****** ****** *)
//
implement
{a}//O(1)-time
braunt_sing(x0) =
braunt_node
(x0, braunt_nil(), braunt_nil())
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_length
{n:int}
(xs: braunt(a, n)): int(n)
//
implement
{a}
braunt_length
  (xs) =
let
prval () =
lemma_braunt(xs)
in length(xs) end where
{
//
fun
length
{n:nat} .<n>.
(
  t0: braunt(a, n)
) : int(n) =
(
case+ t0 of
| braunt_nil() => 0
| braunt_node(_, tl, tr) =>
  let
    val nr = length(tr)
  in
    2 * nr + (1 + differ(tl, nr))
  end
) (* end of [length] *)
//
and
differ
{ nl,nr:nat
| nr <= nl && nl <= nr+1
} .<nr>. 
(
t0: braunt(a, nl), nr: int(nr)
) : int (nl-nr) =
(
case+ t0 of
|
braunt_nil() => 0
|
braunt_node(_, tl, tr) =>
if
(nr > 0)
then
let
val nr2 = half(nr)
in
if
(nr > nr2+nr2)
then differ(tl, nr2) else differ(tr, nr2-1)
end // end of [then]
else 1 // end of [else]
) (* end of [differ] *)
//
} (*where*) // end of [braunt_length]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_differ
{nl:int}
{nr:nat
|nr <= nl
;nl <= nr+1}
( tl: braunt(a, nl)
, tr: braunt(a, nr)): int(nl-nr)
//
implement
{a}
braunt_differ
  (tl, tr) =
(
differ(tl, length(tr))) where
{
//
fun
length
{n:nat} .<n>.
(
  t0: braunt(a, n)
) : int(n) =
(
case+ t0 of
| braunt_nil() => 0
| braunt_node(_, tl, tr) =>
  let
    val nr = length(tr)
  in
    2 * nr + (1 + differ(tl, nr))
  end
) (* end of [length] *)
//
and
differ
{ nl,nr:nat
| nr <= nl && nl <= nr+1
} .<nr>. 
(
t0: braunt(a, nl), nr: int(nr)
) : int (nl-nr) =
(
case+ t0 of
|
braunt_nil() => 0
|
braunt_node(_, tl, tr) =>
if
(nr > 0)
then
let
val nr2 = half(nr)
in
if
(nr > nr2+nr2)
then differ(tl, nr2) else differ(tr, nr2-1)
end // end of [then]
else 1 // end of [else]
) (* end of [differ] *)
//
} (*where*) // end of [braunt_differ]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_get_at
{n:int}
{i:nat|i < n}
(xs: braunt(a, n), i0: int(i)): (a)
//
implement
{a}(*tmp*)
braunt_get_at
{n}(xs, i0) =
(
get_at
(xs, i0)) where
{
//
fun
get_at
{
n,i:nat| i < n
} .<n>.
(
  t0: braunt(a, n), i: int i
) : a =
(
if
i > 0
then let
  val i2 = half(i)
in
//
if
(i > i2 + i2)
then let
val+
braunt_node
(_, tl, _) = t0 in get_at(tl, i2)
end // end of [then]
else
let
val+
braunt_node
(_, _, tr) = t0 in get_at(tr, i2-1)
end // end of [else]
//
end // end of [then]
else let
  val+braunt_node(x0, _, _) = t0 in x0
end // end of [else]
) (* end of [get_at] *)
//
} (*where*) // end of [braunt_get_at]

(* ****** ****** *)
//
implement
{a}
braunt_cons
  (x0, t0) =
(
case+ t0 of
|
braunt_nil() => braunt_sing(x0)
|
braunt_node(x1, tl, tr) =>
braunt_node
(x0, braunt_cons<a>(x1, tr), tl)
)
//
(* ****** ****** *)
//
implement
{a}
braunt_uncons
  (t0) =
(
case+ t0 of
|
braunt_node
(x0, tl, tr) =>
(
case+ tl of
|
braunt_nil() =>
(x0, braunt_nil())
|
braunt_node _ =>
let
  val
  (x1, tl) =
  braunt_uncons<a>(tl)
in
  (x0, braunt_node(x1, tr, tl))
end
)
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
braunt_snoc
{n:int}
(t0: braunt(a, n), x0: a): braunt(a, n+1)
(*
implement
{a}
braunt_snoc
  (t0, x0) =
(
case+ t0 of
|
braunt_nil() => braunt_sing(x0)
|
braunt_node(x1, tl, tr) =>
braunt_node(x1, braunt_snoc<a>(tr, x0), tl)
)
*)
//
implement
{a}
braunt_snoc
  (t0, x0) =
(
  snoc(t0, n0)) where
{
//
val n0 =
braunt_length(t0)
//
fun
snoc
{n:nat} .<n>.
( t0
: braunt(a, n), n: int n
) : braunt(a, n+1) =
(
//
if
n > 0
then let
  val n2 = half(n)
  val+
  braunt_node(x, tl, tr) = t0
in
  if n > n2 + n2
  then
  braunt_node(x, snoc(tl, n2), tr)
  else
  braunt_node(x, tl, snoc(tr, n2-1))
  // end of [if]
end // end of [then]
else braunt_sing<a>(x0)
)
//
prval () = lemma_braunt(t0)
//
} (*where*) // end of [braunt_snoc]
//
(* ****** ****** *)
//
// HX: 20 points
// Please give an implementation
// of O(m+n)-time that concatenates
// two given Braun trees.
// Note that you need to state clearly
// why your implementation is O(m+n).
//
extern
fun
{a:t@ype}
braunt_append
{m,n:int}
( xs: braunt(a, m)
, ys: braunt(a, n)): braunt(a, m+n)
//
(* ****** ****** *)
//
// HX: 20 points
// Please give an implementation
// of O(n)-time that reverses a given
// Braun tree.
// Note that you need to state in clear
// terms as to why your implementation
// is O(n).
//
extern
fun
{a:t@ype}
braunt_reverse
{n:int}(xs: braunt(a, n)): braunt(a, n)
//
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
//
// HX: 20 points
// NO time-complexity is specified
//
extern
fun
choosegen
{m,n:nat | m >= n}
(m: int(m), n: int(n)): mylist(mylist(int))
//
(* ****** ****** *)
//
datatype
mylist1(a:t@ype, int) =
|
mylist1_nil(a, 0) of ()
|
{n:nat}
mylist1_cons(a, n+1) of (a, mylist1(a, n))
//
(* ****** ****** *)
//
dataprop
CHOOSE(int, int, int) =
| {m:nat}
  CHOOSEbas0(m, 0, 1) of ()
| {m:nat}
  CHOOSEbas1(m, m, 1) of ()
| {m,n:int | m > n; n > 0}{r1,r2:int}
  CHOOSEind2(m, n, r1 + r2) of (CHOOSE(m-1, n-1, r1), CHOOSE(m-1, n, r2))
//
(* ****** ****** *)
//
// HX: 30 points
// NO time-complexity is specified
//
extern
fun
choosegen2
{m,n:nat | m >= n}
(m: int(m), n: int(n)): [r:int] (CHOOSE(m, n, r) | mylist1(mylist1(int, n), r))
//
(* ****** ****** *)

(* end of [midterm2.dats] *)
