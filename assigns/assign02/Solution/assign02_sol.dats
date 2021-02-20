(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
#staload "./../assign02.dats"
(* ****** ****** *)

#staload
"./../../../mylib/SATS/mylib.sats"
#staload _ =
"./../../../mylib/DATS/mylib.dats"
(* ****** ****** *)
//
// HX: dummy code
//
implement
{a}(*tmp*)
mylist_append
  (xs, ys) =
let
  val xs =
  mylist_reverse<a>(xs)
in
  mylist_rappend<a>(xs, ys)
end
//
(* ****** ****** *)
//
// HX: dummy code
//
implement
{a}(*tmp*)
mylist_rappend
  (xs, ys) =
  loop(xs, ys) where
{
fun
loop
( xs: mylist(a)
, ys: mylist(a)): mylist(a) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x0, xs) =>
  loop(xs, mylist_cons(x0, ys))
)
}
//
(* ****** ****** *)

(*
implement
{a}(*tmp*)
matrix_validate
  ( M ) =
let
val+
MATRIX(xss, ncol) = M
in
loop(xss) where
{
  fun
  loop(xss: mylist(mylist(a))): bool =
  (
  case+ xss of
  | mylist_nil() => true
  | mylist_cons(xs, xss) =>
    if ncol = mylist_length<a>(xs) then loop(xss) else false
  )
}
end // end of [matrix_validate]
*)

(* ****** ****** *)

implement
{a}(*tmp*)
matrix_validate
  ( M ) =
let
val+
MATRIX(xss, ncol) = M
in
mylist_forall<mylist(a)>
(xss, lam xs => mylist_length<a>(xs) = ncol)
end // end of [matrix_validate]

(* ****** ****** *)

implement
{a}(*tmp*)
matrix_transpose
  ( M ) =
(
MATRIX(yss, nrow)
) where
{
//
val+
MATRIX(xss, ncol) = M
//
val
nrow =
mylist_length<mylist(a)>(xss)
//
val
yss =
auxlst(ncol, xss) where
{
fun
auxlst
( n0
: int
, xss
: mylist(mylist(a))
)
: mylist(mylist(a)) =
(
if
n0 <= 0
then mylist_nil()
else
let
//
val ys =
mylist_map<mylist(a)><a>
( xss
, lam(xs) =>
  let
  val-mylist_cons(x0, _) = xs in x0
  end
)
val xss =
mylist_map<mylist(a)><mylist(a)>
( xss
, lam(xs) =>
  let
  val-mylist_cons(_, xs) = xs in xs
  end
)
//
in
  mylist_cons(ys, auxlst(n0 - 1, xss))
end // end of [else]
)
} (*where*) // end of [val yss]
//
} (*where*) // end of [matrix_transpose]

(* ****** ****** *)

(* end of [assign02_sol.dats] *)
