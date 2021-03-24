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
implement
{a}
mystrm_enumerate
(xss) =
(
let
fun
helper
(
xss:
mystrm
(mystrm(a))): mystrm(a) =
$delay
(
case !xss of
|
stream_nil() =>
stream_nil()
|
stream_cons(xs1, xss) =>
(
case+ !xs1 of
| stream_nil() => !(helper(xss))
| stream_cons(x1, xs1) =>
  stream_cons(x1, alter(xs1, helper(xss)))
)
)
in
  helper(xss)
end
) where
{
fun
alter
( xs: mystrm(a)
, ys: mystrm(a)): mystrm(a) =
$delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x1, xs) => 
  stream_cons(x1, alter(ys, xs))
)
}
(* ****** ****** *)

val _Q1_ =
{
//
val xss = from1(0)
//
val () =
println!
(
"_Q1_: before enumeration"
)
//
val
_enum_ =
mystrm_enumerate<int2>(xss)
//
val N = 100
//
val () =
loop(_enum_, 0) where
{
fun
loop
(xs: mystrm(int2), i: int): void =
if
(i < N)
then
loop(xs, i+1) where
{
val-
stream_cons(x1, xs) = !xs
val () =
println!("x1 = (", x1.0, ",", x1.1, ")")
}
}
//
} where
{
//
typedef
int2 = (int, int)
//
fun
from1
( i
: int )
: stream(stream(int2)) =
$delay
(
stream_cons(from2(i, i), from1(i+1))
)
and
from2
( i
: int
, j: int): stream(int2) =
$delay
(
stream_cons((i, j), from2(i, j+1))
)
//
} (*where*) // end of [val _Q1_]

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_Q1_test.dats] *)
