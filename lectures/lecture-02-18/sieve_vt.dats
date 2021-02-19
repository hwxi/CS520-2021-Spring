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
//
// A linear type is given the name 'viewtype'
//
(* ****** ****** *)

fun
from_vt
( i: int ): stream_vt(int) =
$ldelay(stream_vt_cons(i, from_vt(i+1)))

(* ****** ****** *)

(*
val
theNats_vt =
from_vt(0)
val xs = theNats_vt
val-
~stream_vt_cons(x0, xs)   = !xs
val () = println!("x0 = ", x0)
val-
~stream_vt_cons(x1, xs)   = !xs
val () = println!("x1 = ", x1)
*)

(* ****** ****** *)

fun
sieve_vt
( xs
: mylstrm(int)
)
: mylstrm(int) =
$ldelay
(
let
val-
~stream_vt_cons(x0, xs) = !xs
val xs =
mylstrm_filter<int>(xs, lam(x1) => x1 % x0 > 0)
in
  stream_vt_cons(x0, sieve_vt(xs))
end
,
~xs
)
(* ****** ****** *)

val thePrimes_vt = sieve_vt(from_vt(2))

(* ****** ****** *)

fun
{a:t@ype}
mylstrm_get_at
(xs: mylstrm(a), n: int): a =
(
  loop(xs, n)
) where
{
fun
loop
(xs: mylstrm(a), n: int): a =
let
val-
~stream_vt_cons(x0, xs) = !xs
in
  if n <= 0 then (~xs; x0) else loop(xs, n-1)
end
}

(* ****** ****** *)
//
val P5000 = mylstrm_get_at<int>(thePrimes_vt, 5000)
val () = println!("p5000 = ", P5000)
//
(* ****** ****** *)

(* end of [sieve_vt.dats] *)
