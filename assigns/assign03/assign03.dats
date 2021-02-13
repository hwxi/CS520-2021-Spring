(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

(*
//
// Points: 10
//
The following is a well-known series:

ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...

Please implement a stream consisting of all the partial
sums of this series. Then compute an accurate approximation
to ln2 by using Euler's transform (if you do the following
EulerTrans question).

//
*)
extern
fun{}
stream_ln2(): stream(double)

(* ****** ****** *)
//
// Points: 10
//
// Please implement the following function that enumerates
// all the pairs of natural numbers (i, j) satisfying i <= j:
//
typedef int2 = (int, int)
//
extern
fun{}
intpair_enumerate((*void*)): stream(int2)
//
(* ****** ****** *)
//
// HX: 10 points
// Please implement the Euler transform:
// Given a sequence:
//   x(0), x(1), x(2), ..., x(n), ...
// We can form another sequence:
//   y(0), y(1), y(2), ..., y(n), ....
// such that each y(n) equals the the follow value
//
// x(n+2) - (x(n+2)-x(n+1))^2 / (x(n)+x(n+2)-2*x(n+1))
//
extern
fun{}
EulerTrans(xs: stream(double)): stream(double)
//
(* ****** ****** *)

(* end of [assign03.dats] *)
