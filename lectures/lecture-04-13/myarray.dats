(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/SATS/mylib.sats"
#staload _ =
"./../../mylib/DATS/mylib.dats"
(* ****** ****** *)

abstype
myarray(a:t@ype) = ptr
abstype
myarray1(a:t@ype, n:int) = ptr

(* ****** ****** *)
//
extern
fun
{a:t@ype}
myarray1_length
{n:int}(A:myarray1(a, n)): int(n)
//
extern
fun
{a:t@ype}
myarray1_get_at
{n:int}
{i:nat|i < n}
(A: myarray1(a, n), i: int(i)): a
extern
fun
{a:t@ype}
myarray1_set_at
{n:int}
{i:nat|i < n}
(A: myarray1(a, n), i: int(i), x0: a): void
//
overload [] with myarray1_get_at // A[i]
overload [] with myarray1_set_at // A[i] := x
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
myarray1_bsearch
{n:nat}
( A0: myarray1(a, n)
, k0: a
, cmp: (a, a) -<cloref1> int): bool
//
(* ****** ****** *)

implement
{a}
myarray1_bsearch
{n}
(A0, k0, cmp) =
let

// [l, u)

fun
helper
{ l,u:int
| 0 <= l
; l <= u
; u <= n} .<u-l>.
(l: int(l), u: int(u)): bool =
if
(l >= u)
then false
else let
val m =
(l+u) / 2
val k = A0[m]
val sgn = cmp(k, k0)
in
if
(sgn < 0)
then helper(m+1, u)
else helper(l, m-0)
end

in
  helper(0, myarray1_length(A0))
end


(* ****** ****** *)

