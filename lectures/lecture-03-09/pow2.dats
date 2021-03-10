(* ****** ****** *)
dataprop
POW2(int, int) =
|
POW2_R1(0, 1) of () // 2^0 = 1
|
{n:nat}
{r:int}
POW2_R2(n+1, r+r) of POW2(n, r) // 2^n = r implies 2^{n+1} = r + r
(* ****** ****** *)

extern
fun
pow2
{n:nat}
(n: int(n)): [r:int] (POW2(n, r) | int(r))

(* ****** ****** *)

(* end of [pow2.dats] *)
