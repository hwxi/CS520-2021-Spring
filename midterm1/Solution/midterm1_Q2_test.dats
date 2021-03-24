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
(* ****** ****** *)
extern
fun
{a:t@ype}
print_mytree
(mytree(a)): void
overload print with print_mytree of 1000
extern
fun
{a:t@ype}
fprint_mytree
(FILEref, mytree(a)): void
overload fprint with fprint_mytree of 1000
(* ****** ****** *)
implement
{a}
print_mytree
(t0) =
fprint_mytree<a>(stdout_ref, t0)
implement
{a}
fprint_mytree
(out, t0) =
(
case+ t0 of
|
mytree_sing(x0) =>
(
fprint!(out, "(");
fprint_val<a>(out, x0);
fprint!(out, ")")
)
|
mytree_pair(t1, t2) =>
fprint!(out, "(", t1, ";", t2, ")")
)

(* ****** ****** *)
implement
(a)
fprint_val<mytree(a)> = fprint_mytree<a>
(* ****** ****** *)

fun
fsize
(n: int): int =
if
(n <= 1)
then (n)
else auxint(1) where
{
fun
auxint(i: int): int =
if i < n then
fsize(i) * fsize(n-i) + auxint(i+1) else 0
}

(* ****** ****** *)

val _Q2_ =
{
//
val () =
println!("fsize(1) = ", fsize(1))
val () =
println!("fsize(2) = ", fsize(2))
val () =
println!("fsize(3) = ", fsize(3))
val () =
println!("fsize(4) = ", fsize(4))
val () =
println!("fsize(5) = ", fsize(5))
val () =
println!("fsize(6) = ", fsize(6))
val () =
println!("fsize(7) = ", fsize(7))
val () =
println!("fsize(8) = ", fsize(8))
//
val xs =
mylist_nil()
val xs =
mylist_cons(1, xs)
val xs =
mylist_cons(2, xs)
val xs =
mylist_cons(3, xs)
val xs =
mylist_cons(4, xs)
val xs =
mylist_cons(5, xs)
val xs =
mylist_cons(6, xs)
val xs =
mylist_cons(7, xs)
val xs =
mylist_cons(8, xs)
//
val xs = mylist_reverse(xs)
//
val ln = mylist_length<int>(xs)
//
val xss = list2mytrees<int>(xs)
//
val ( ) = println!("xss = ", xss)
val ( ) =
println!
("|xss| = ", mylist_length(xss))
val ( ) =
println!("fsize(", ln, ") = ", fsize(ln))
} (*where*) // end of [val _Q2_]

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_Q2_test.dats] *)
