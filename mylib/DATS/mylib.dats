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

(* end of [mylib.dats] *)
