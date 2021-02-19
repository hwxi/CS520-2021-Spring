(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)
#staload
"./../../mylib/SATS/mylib.sats"
#staload _ =
"./../../mylib/DATS/mylib.dats"
(* ****** ****** *)
#staload
"./../../assigns/assign03/assign03.dats"
(* ****** ****** *)

fun
from
( i: int ): stream(int) =
$delay(stream_cons(i, from(i+1)))

(* ****** ****** *)

val theNats = from(0)

(* ****** ****** *)

val
myseq =
mystrm_map<int><double>
(theNats, lam(n) => 1.0/(n+1))

(* ****** ****** *)

extern
fun
stream_alternate
(xs: stream(double)): stream(double)

(* ****** ****** *)

extern
fun
stream_psums
(xs: stream(double)): stream(double)

(* ****** ****** *)
