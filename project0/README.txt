(*
######
#
# Animating Quicksort
#
######
*)

(* ****** ****** *)
//
// Basic Idea
//
(* ****** ****** *)

First, please implement quicksort of the
following interface:

(*
fun
{a:t@ype}
quicksort
(A: myarray(a)): void
fun
{a:t@ype}
quicksort1 // dependently-typed
{n:int}(A: myarray1(a, n)): void
*)

This implementation makes use of a few other functions.
In particular, it calls the following function 'swap' to
swap two elements in a given array:

(*
fun
{a:t@ype}
swap
(A: myarray(a), i: int, j: int): void
fun
{a:t@ype}
swap1
{n:int}
{ i,j:nat
| i < j; j < n} // dependently typed
(A: myarray1(a, n), i: int(i), j: int(j)): void
*)

(* ****** ****** *)

Now please turn quicksort into quicksort_step which does
what is called 'stepization', that is, turning a computation
into a stream of computation steps (or just steps for short).
Animating can be implemented as a function that inspects this
stream of steps.

(* ****** ****** *)

Let me use an example to explain what 'stepization' is like.

The factorial function can be implemented as follows:

fun
fact(n0: int): int =
if n0 > 0 then n0 * fact(n0-1) else 1

When computing fact(n0) for a given integer n0, you may
count each recursive call to 'fact' as a computation step.
Of course, if you like, you can count subtraction (-) and
multiplication (*) as computation steps as well.

Note that each computation consists of a sequence of steps.
By stepization, I mean to decompose a computation into a stream
of steps. For representing a step, we need to make use of the
notion of continuation:

(* ****** ****** *)

The CPS counterpart of 'fact' can be given as follows:

fun
kfact
( n0: int
, k0: int -<cloref1> int): int =
if
(n0 > 0)
then kfact(n0-1, lam(res) => n0 * res) else k0(1)

(* ****** ****** *)

datatype
STEP(ans:t@ype) =
| DONE of (ans)
| FACT of (int, int -<cloref1> STEP(ans))

Give a type T, STEP(T) is for steps in a computation
that returns a value of type T.

(* ****** ****** *)

The function kfact can be converted into the following
one:

fun
{ans:t@ype}
fact_step
( n0: int
, k0: int -<cloref1> STEP(ans)): STEP(ans) =
(
  if
  n0 > 0
  then
  FACT(n0-1, lam(r0) => k0(n0 * r0)) else k0(1)
)

(* ****** ****** *)

Given a step, it can be evaluated into the next step:

fun
{ans:t@ype}
step_eval
(step: STEP(ans)): STEP(ans) =
(
case+ step of
| DONE(r0) => step
| FACT(n0, k0) => fact_step(n0, k0)
)

(* ****** ****** *)

Now we can turn 'fact(n0)' into a stream of steps:

fun
{ans:t@ype}
step_meval
( step
: STEP(ans))
: stream_vt_con(STEP(ans)) =
stream_vt_cons
(step, $ldelay(step_meval(step_eval(step))))


fun
{ans:t@ype}
fact_stepize
(n0: int): stream_vt(STEP(int)) =
$ldelay
(
step_meval(FACT(n0, lam(res) => DONE(res)))
)

(* ****** ****** *)

The factorial function can be implemented as follows:

fun
{ans:t@ype}
stream_get_ans
(xs: stream_vt(STEP(ans))): ans =
(
case- !xs of
|
~stream_vt_cons(x0, xs) =>
(
case+ x0 of
| DONE(r0) => (~xs; r0) | _ => stream_get_ans(xs))
)

fun
fact(n0: int): int = stream_get_ans(fact_stepize(n0))

(* ****** ****** *)

Now suppose that 'quicksort' on an integer array can
be stepized by the following function:

fun
quicksort_stepize
(A: myarray(int)): stream_vt(STEP(int))
(*
fun
quicksort1_stepize
{n:int}
(A: myarray1(int, n)): stream_vt(STEP(int))
*)

Strictly speaking, the type for steps here should be
STEP(void). However, C has a very peculiar way for handling
the type void. Instead, STEP(int) is used to avoid potential
issues with the type void.

Please note that 'STEP' needs to be define for quicksort;
its definition should look like:

datatype
STEP(ans:t@ype) =
| DONE of (ans)
| SWAP of ...... // for swapping
| QSORT of ...... // for a sorting call
| PIVOT of ...... // for choosing a pivot
| ...

(* ****** ****** *)

(* end of [README.txt] *)
