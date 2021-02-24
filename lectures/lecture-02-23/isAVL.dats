
(* ****** ****** *)

datatype
mytree(a:t@ype) =
|
mytree_nil of ()
|
mytree_cons of
(mytree(a), a, mytree(a))

(* ****** ****** *)

extern
fun
{a:t@ype}
mytree_size(t0: mytree(a)): int

extern
fun
{a:t@ype}
mytree_height(t0: mytree(a)): int

implement
{a}
mytree_size(t0) =
(
case+ t0 of
| mytree_nil() => 0
| mytree_cons(tl, _, tr) =>
  1 + mytree_size<a>(tl) + mytree_size<a>(tr)
)

implement
{a}
mytree_height(t0) =
(
case+ t0 of
| mytree_nil() => 0
| mytree_cons(tl, _, tr) =>
  1 + max(mytree_height<a>(tl), mytree_height<a>(tr))
)

(* ****** ****** *)

(*
sz(t0) < 2^(ht(t0))
sz(t0) > 2^(c*ht(t0)) for a fixed constant c: 0 < c < 1
*)

(*
Rule 1: mytree_nil() is an AVL-tree
Rule 2:
mytree_cons(tl, x0, tr) is an AVL-tree
if tl is AVL and tr is AVL and |ht(tl) - ht(tr)| <= 1
*)

fun
{a:t@ype}
isAVL
(t0: mytree(int)): bool =
(
case+ t0 of
| mytree_nil() => true
| mytree_cons(tl, _, tr) =>
  if
  (isAVL(tl) && isAVL(tr))
  then abs(mytree_height(tl)-mytree_height(tr)) <= 1
  else false
)

(* ****** ****** *)

fun
{a:t@ype}
isAVL2
( t0
: mytree(int)): bool =
(
(helper(t0)).1) where
{
fun
helper
( t0
: mytree(int)): (int, bool) =
(
case+ t0 of
| mytree_nil() => (0, true)
| mytree_cons(tl, _, tr) =>
  let
  val (hl, al) = helper(tl)
  val (hr, ar) = helper(tr)
  in
    if (al && ar) then (1+max(hl,hr), abs(hl-hr) <= 1) else (1+max(hl,hr), false)
  end
)
} (* end of [isAVL2] *)

(* ****** ****** *)

fun
{a:t@ype}
isAVL3
( t0
: mytree(int)): bool =
let
//
exception NotAVLExn of ()
//
fun
helper
( t0
: mytree(int)): int =
(
case+ t0 of
| mytree_nil() => 0
| mytree_cons(tl, _, tr) =>
  let
  val hl = helper(tl)
  val hr = helper(tr)
  in
    if
    abs(hl-hr) > 1
    then $raise NotAVLExn()
    else 1+max(hl,hr)
  end
)
in
  try
    let val _ = helper(t0) in true end
  with ~NotAVLExn() => false
end

(* ****** ****** *)

(* end of [isAVL.dats] *)
