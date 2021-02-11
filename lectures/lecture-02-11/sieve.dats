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
//
val xs = thePrimes
//
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
//
(* ****** ****** *)

(* end of [sieve.dats] *)
