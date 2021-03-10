(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

dataprop
POW2(int, int) =
|
POW2_R1(0, 1) of () // 2^0 = 1
|
{n:nat}
{r:int}
POW2_R2(n+1, 2*r) of POW2(n, r) // 2^n = r implies 2^{n+1} = 2*r

(* ****** ****** *)
//
// HX: 10 points
// Please give a
// verified implementation of pow2_rec
//
(*
fun
pow2_rec(n) =
if n >= 1 then 2 * pow2_rec(n-1) else 1
*)
extern
fun
pow2_rec
{n:nat}
(n: int(n)): [r:int] (POW2(n, r) | int(r))
//
(* ****** ****** *)
//
// HX: 15 points
// Please give a
// verified implementation of pow2_trec
//
(*
fun
pow2_trec(n) =
loop(n, 1) where
{
fun
loop(n: int, r: int): int
if n >= 1 then loop(n-1, 2*r) else r
*)
extern
fun
pow2_trec
{n:nat}
(n: int(n)): [r:int] (POW2(n, r) | int(r))
//
(* ****** ****** *)

(* end of [assign05.dats] *)
