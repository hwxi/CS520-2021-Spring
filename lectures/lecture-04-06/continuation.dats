(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

fun
fact(x: int): int =
if x > 0 then x*fact(x-1) else 1

(* ****** ****** *)
//
// CPS-style (Continuation Passing)
//
fun
kfact
( x: int
, k0: (int) -<cloref1> void): void =
if
x = 0
then k0(1) // tail-call
else kfact(x-1, lam(res) => k0(x * res))
//
(* ****** ****** *)

datatype
state =
|
STATE of
(int, int -<cloref1> void)

(* ****** ****** *)

fun
kfact2
(st: state): state =
(
case+ st of
|
STATE(x, k0) =>
if x = 0
then
STATE(0, k0)
else
STATE(x-1, lam(res) => k0(x * res))
)

(* ****** ****** *)

fun
kfact3
(st0: state): stream(state) =
$delay
(
stream_cons(st0, kfact3(kfact2(st0)))
)

(* ****** ****** *)

fun
kfact4
( x: int
, k0: int -<cloref1> void): stream(state) =
(
  kfact3(STATE(x, k0))
)

(* ****** ****** *)

exception QuitExn of ()

(* ****** ****** *)

fun
keval
(st0: state): void =
(
case+ st0 of
|
STATE(x, k0) =>
if
(x != 0)
then
println!("x = ", x)
else
(println!("quit: x = ", x); $raise(QuitExn());)
)
fun
kevals
(sts: stream(state)): void =
(
case- !sts of
| stream_cons(st1, sts) =>
  let val () = keval(st1) in kevals(sts) end
)

(* ****** ****** *)

val () =
try
kevals
(kfact4(10, lam(res) => ())) with ~QuitExn() => ()

(* ****** ****** *)

(* end of [continuation.dats] *)
