(* ****** ****** *)
(*
mylib for
CS520, Spring, 2021
*)
(* ****** ****** *)

#staload
"./../SATS/mylib.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
myoptn_length
  (xs) =
(
case+ xs of
| myoptn_nil() => 0 | _ => 1
)

(* ****** ****** *)

implement
{a}(*tmp*)
print_myoptn(xs) =
fprint_myoptn<a>(stdout_ref, xs)

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_myoptn
  (out, xs) =
(
case+ xs of
| myoptn_nil() =>
  {
    val () =
    fprint(out, "()")
  }
| myoptn_cons(x0) =>
  {
    val () =
    fprint(out, "(")
    val () =
    fprint_val<a>(out, x0)
    val () =
    fprint(out, ")")
  }
) (* end of [fprint_myoptn] *)

(* ****** ****** *)

implement
{a}(*tmp*)
print_mylist(xs) =
fprint_mylist<a>(stdout_ref, xs)

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_mylist
  (out, xs) =
(
  auxloop(0, xs)
) where
{
fun
auxloop
( i0: int
, xs: mylist(a)): void =
(
case+ xs of
| mylist_nil() => ()
| mylist_cons(x0, xs) =>
  (
    auxloop(i0+1, xs)
  ) where
  {
  val () =
    if
    (i0 > 0)
    then
    fprint(out, ';')
  val () =
    fprint_val<a>(out, x0)
  } (*where*) // mylist_cons
)
} (* end of [fprint_mylist] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
mylist_sing(x0) =
mylist_cons
(x0, mylist_nil())
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_length
  ( xs ) =
(
  auxloop(0, xs)
) where
{
fun
auxloop
( i0: int
, xs: mylist(a)): int =
(
case+ xs of
| mylist_nil() => i0
| mylist_cons(_, xs) =>
  (
    auxloop(i0+1, xs)
  )
)
} (* end of [mylist_length] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_reverse
  ( xs ) =
(
mylist_rappend<a>(xs, mylist_nil())
)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_equal
  (xs1, xs2) =
(
  loop(xs1, xs2)
) where
{
fun
loop
( xs1: mylist(a)
, xs2: mylist(a)): bool =
(
case+ xs1 of
|
mylist_nil() =>
(
case+ xs2 of
| mylist_nil() => true
| mylist_cons _ => false
)
|
mylist_cons(x1, xs1) =>
(
case+ xs2 of
| mylist_nil() => false
| mylist_cons(x2, xs2) =>
  if
  geq_val_val<a>(x1, x2)
  then loop(xs1, xs2) else false
)
)
} (* end of [mylist_equal] *)

(* ****** ****** *)

implement
{a}{b}
mylist_map
(xs, f0) =
mylist_reverse<b>
(mylist_maprev<a><b>(xs, f0))

implement
{a}{b}
mylist_maprev
(xs, f0) =
loop(xs, mylist_nil()) where
{
fun
loop
( xs: mylist(a)
, ys: mylist(b)): mylist(b) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x0, xs) =>
  loop(xs, mylist_cons(f0(x0), ys))
)
} (* end of [mylist_maprev] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
mylist_filter
(xs, f0) =
mylist_foldright<a><mylist(a)>
( xs
, mylist_nil()
, lam(x0, r0) =>
  if f0(x0) then mylist_cons(x0, r0) else r0)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_forall
(xs, f0) = loop(xs) where
{
fun
loop
( xs: mylist(a)): bool =
(
case+ xs of
| mylist_nil() => true
| mylist_cons(x0, xs) =>
  if
  f0(x0)
  then loop(xs) else false
)
} (* end of [mylist_forall] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_foreach
(xs, f0) = loop(xs) where
{
fun
loop
( xs: mylist(a)): void =
(
case+ xs of
| mylist_nil() => ()
| mylist_cons(x0, xs) =>
  let
  val () = f0(x0) in loop(xs)
  end
)
} (* end of [mylist_foreach] *)

(* ****** ****** *)

implement
{a}{r}
mylist_foldleft
(
  xs, r0, f0
) = loop(xs, r0) where
{
fun
loop(xs: mylist(a), r0: r): r =
(
case+ xs of
| mylist_nil() => r0
| mylist_cons(x0, xs) => loop(xs, f0(r0, x0))
)
}

(* ****** ****** *)

(*
implement
{a}(*tmp*)
mylist_length(xs) =
mylist_foldleft<a><int>
( xs
, 0, lam(r0, x0) => r0 + 1)
*)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_rappend
(xs, ys) =
mylist_foldleft<a><mylist(a)>
( xs
, ys, lam(r0, x0) => mylist_cons(x0, r0))

(* ****** ****** *)
(*
implement
{a}(*tmp*)
mylist_reverse(xs) =
mylist_foldleft<a><mylist(a)>
( xs
, mylist_nil(), lam(r0, x0) => mylist_cons(x0, r0))
*)
(* ****** ****** *)

implement
{a}
mylist_append(xs, ys) =
mylist_foldright<a><mylist(a)>
(xs, ys, lam(x0, r0) => mylist_cons(x0, r0))  

(* ****** ****** *)

(*
implement
{a}(*tmp*)
mylist_append(xs, ys) =
mylist_rappend<a>(mylist_reverse<a>(xs), ys)
*)

(* ****** ****** *)

implement
{a}
mylist_concat(xss) =
(
case+ xss of
| mylist_nil() =>
  mylist_nil()
| mylist_cons(xs, xss) =>
  mylist_append<a>(xs, mylist_concat<a>(xss))
)

(* ****** ****** *)

(*
implement
{a}{b}
mylist_map(xs, f0) =
mylist_foldright<a><mylist(b)>
( xs
, mylist_nil()
, lam(x0, r0) => mylist_cons(x0, r0))  
*)

(* ****** ****** *)

(*
implement
{a}{b}(*tmp*)
mylist_maprev(xs, f0) =
mylist_foldleft<a><mylist(b)>
( xs
, mylist_nil(), lam(r0, x0) => mylist_cons(f0(x0), r0))
*)

(* ****** ****** *)
//
(*
implement
{a}{r}
mylist_foldright
(
  xs, r0, f0
) = auxlst(xs, r0) where
{
fun
auxlst(xs: mylist(a), r0: r): r =
(
case+ xs of
| mylist_nil() => r0
| mylist_cons(x0, xs) => f0(x0, auxlst(xs, r0))
)
}
*)
//
implement
{a}{r}
mylist_foldright
(
  xs, r0, f0
) =
let
val xs = mylist_reverse<a>(xs)
in
  mylist_foldleft<a><r>(xs, r0, lam(r0, x0) => f0(x0, r0))
end // end of [mylist_foldright]
//
(* ****** ****** *)

implement
{a}{b}
mylist_xprod2
(xs, ys) =
(
xprod2(xs, ys)
) where
{
fun
xprod2
( xs
: mylist(a)
, ys
: mylist(b))
: mylist(@(a, b)) =
(
case+ xs of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons(x1, xs) =>
let
val res = xprod2(xs, ys)
in
mylist_foldright
( ys, res
, lam(y2, res) =>
  mylist_cons((x1, y2), res))
end
) (* end of [xprod2] *)
} (* end of [mylist_xprod2] *)

(* ****** ****** *)

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

(*
implement
{a}{b}
mystrm_map
( xs, f0 ) =
$delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs) =>
  stream_cons(f0(x0), mystrm_map<a><b>(xs, f0))
)
*)
implement
{a}{b}
mystrm_map
( xs, f0 ) =
auxstrm(xs) where
{
fun
auxstrm
(xs: stream(a)): stream(b) =
$delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x0, xs) => stream_cons(f0(x0), auxstrm(xs))
)
} (* end of [mystrm_map] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mystrm_filter
( xs, f0 ) =
auxstrm(xs) where
{
fun
auxstrm
(xs: stream(a)): stream(a) =
$delay
(
case+ !xs of
|
stream_nil() =>
stream_nil()
|
stream_cons(x0, xs) =>
if
f0(x0)
then stream_cons(x0, auxstrm(xs)) else !(auxstrm(xs))
)
} (* end of [mystrm_filter] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mystrm_append
  (xs, ys) =
(
  auxmain(xs)
) where
{
fun
auxmain
( xs
: mystrm(a)): mystrm(a) =
$delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x0, xs) =>
  stream_cons(x0, auxmain(xs))
)
}

(* ****** ****** *)

implement
{a}(*tmp*)
mystrm_concat
  (xss) =
(
  auxmain(xss)
) where
{
fun
auxmain
( xss
: mystrm(mystrm(a))): mystrm(a) =
$delay
(
case+ !xss of
| stream_nil() => stream_nil()
| stream_cons(xs, xss) =>
 !(mystrm_append<a>(xs, auxmain(xss)))
)
}

(* ****** ****** *)

implement
{a}
mystrm_merge
( xs, ys, cmp) =
(
  helper(xs, ys)
) where
{
fun
helper
( xs: mystrm(a)
, ys: mystrm(a)): mystrm(a) =
$delay
(
case+ !xs of
|
stream_nil() => !ys
|
stream_cons(x0, xs1) =>
(
case+ !ys of
|
stream_nil() =>
stream_cons(x0, xs1)
|
stream_cons(y0, ys1) =>
let
val
sgn = cmp(x0, y0)
in
if
sgn <= 0
then stream_cons(x0, helper(xs1, ys))
else stream_cons(y0, helper(xs, ys1))
end
)
)
} (* end of [mystrm_merge] *)

(* ****** ****** *)
//
(*
HX-2021-02-18:
For linear streams
*)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylstrm_filter
( xs, f0 ) =
auxstrm(xs) where
{
fun
auxstrm
(xs: mylstrm(a)): mylstrm(a) =
$ldelay
(
case+ !xs of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
~stream_vt_cons(x0, xs) =>
if
f0(x0)
then stream_vt_cons(x0, auxstrm(xs)) else !(auxstrm(xs))
,
~xs
)
} (* end of [mylstrm_filter] *)

(* ****** ****** *)

local

assume
myarray(a:t@ype) = arrszref(a)

in(* in-of-local *)

(* ****** ****** *)
//
implement
{a}
myarray_length
( A0 ) =
(
sz2i(asz)) where
{
var asz: size_t
val _A_ =
arrszref_get_refsize{a}(A0, asz)
}
//
(* ****** ****** *)

implement
{a}
myarray_make_elt
(i0, x0) =
let
val i0 = g1ofg0(i0)
val () =
assertloc( i0 >= 0 )
in
arrszref_make_elt(i2sz(i0), x0)
end // end of [myarray_make_elt]

(* ****** ****** *)

implement
{a}
myarray_get_at
(A0, i0) =
let
val i0 = g1ofg0(i0)
val () =
assertloc( i0 >= 0 )
in
arrszref_get_at(A0, i2sz(i0))
end // end of [myarray_get_at]

(* ****** ****** *)

implement
{a}
myarray_set_at
(A0, i0, x0) =
let
val i0 = g1ofg0(i0)
val () =
assertloc( i0 >= 0 )
in
arrszref_set_at(A0, i2sz(i0), x0)
end // end of [myarray_set_at]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

assume
myarray1
(a:t@ype, n:int) = arrayref(a, n)

in(* in-of-local *)

(* ****** ****** *)
//
implement
{a}
myarray1_make_elt
(i0, x0) =
arrayref_make_elt(i2sz(i0), x0)
//
(* ****** ****** *)

implement
{a}
myarray1_get_at
(A0, i0) =
arrayref_get_at( A0, i2sz(i0) )
implement
{a}
myarray1_set_at
(A0, i0, x0) =
arrayref_set_at(A0, i2sz(i0), x0)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [mylib.dats] *)
