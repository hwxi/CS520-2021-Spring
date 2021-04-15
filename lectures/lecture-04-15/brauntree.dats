
datatype
braunt(a:t@ype, int) =
|
braunt_nil(a, 0) of () 
|
{nl,nr:nat
| nr <= nl
; nl <= nr+1}
braunt_node
(a, nl+nr+1) of
(a, braunt(a, nl), braunt(a, nr))

extern
prfun
lemma_braunt
{a:t@ype}{n:int}
(t0: braunt(a, n)): [n >= 0] void

extern
fun
{a:t@ype}
braunt_size
{n:int}(t0: braunt(a, n)): int(n)

implement
{a}//O(n)-time
braunt_size(t0) =
(
case+ t0 of
| braunt_nil() => 0
| braunt_node(_, tl, tr) =>
  1+braunt_size(tl)+braunt_size(tr)
)

extern
fun
{a:t@ype}
braunt_sing(x0: a): braunt(a, 1)
implement
{a}//O(1)-time
braunt_sing(x0) =
braunt_node
(x0, braunt_nil(), braunt_nil())

extern
fun
{a:t@ype}
braunt_snoc
{n:int}
(t0: braunt(a, n), x0: a): braunt(a, n+1)
implement
{a}
braunt_snoc
  (t0, x0) =
(
case+ t0 of
| braunt_nil() => braunt_sing(x0)
| braunt_node(x1, tl, tr) =>
  braunt_node(x1, braunt_snoc<a>(tr, x0), tl)
)

extern
fun
{a:t@ype}
braunt_uncons
{n:pos}(t0: braunt(a, n)): (a, braunt(a, n-1))
implement
{a}//O(log(n))
braunt_uncons(t0) =
(
case+ t0 of
(*
| braunt_nil() =>
*)
|
braunt_node(x0, tl, tr) =>
(
case+ tl of
|
braunt_nil() =>
(x0, braunt_nil())
|
braunt_node _ =>
let
val
(x1, tl) =
braunt_uncons<a>(tl)
in
  (x0, braunt_node(x1, tr, tl))
end
)
) (* end of [braunt_uncons] *)
