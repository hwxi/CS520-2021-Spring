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

fun
from
( i: int ): stream(int) =
$delay(stream_cons(i, from(i+1)))

(* ****** ****** *)

fun
sieve
( xs
: stream(int)): stream(int) =
$delay
(
let
val-stream_cons(x0, xs) = !xs
val xs =
mystrm_filter<int>(xs, lam(x1) => x1 % x0 > 0)
in
  stream_cons(x0, sieve(xs))
end
)

val thePrimes = sieve(from(2))

(* ****** ****** *)

fun
{a:t@ype}
mystrm_get_at
(xs: mystrm(a), n: int): a =
(
  loop(xs, n)
) where
{
fun
loop
(xs: mystrm(a), n: int): a =
let
val-stream_cons(x0, xs) = !xs
in
  if n <= 0 then x0 else loop(xs, n-1)
end
}

(* ****** ****** *)
//
val P5000 =
mystrm_get_at<int>(thePrimes, 5000)
val () = println!("P5000 = ", P5000)
//
(* ****** ****** *)

(* end of [sieve.dats] *)
