(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

datatype
myrbtree(a:t@ype) =
|
myrbtree_nil of ()
|
myrbtree_blk of
(myrbtree(a), a, myrbtree(a))
|
myrbtree_red of
(myrbtree(a), a, myrbtree(a))

(* ****** ****** *)
//
// HX:
// [myrbtree_size] computes
// the size of a given tree
//
extern
fun
{a:t@ype}
myrbtree_size(myrbtree(a)): int

(* ****** ****** *)
//
// HX:
// [myrbtree_isblk] tests whether
// a tree is black. Note that the
// empty tree is considered black.
//
extern
fun
{a:t@ype} // 1 point
myrbtree_isblk(myrbtree(a)): bool

(* ****** ****** *)
//
// HX:
// [myrbtree_height] computes
// the height of a given tree
//
extern
fun
{a:t@ype} // 2 points
myrbtree_height(myrbtree(a)): int
//
// HX:
// [myrbtree_bheight] computes
// the "black" height of a given
// tree (by ignoring red nodes)
//
extern
fun
{a:t@ype} // 2 points
myrbtree_bheight(myrbtree(a)): int
//
(* ****** ****** *)
(*
//
A tree [t0] is a red-black tree if
//
1. t0 is empty; or
2. t0 = myrbtree_blk(tl, x0, tr)
   where tl and tr are red-black trees,
   and bheight(tl) = bheight(tr); or
3. t0 = myrbtree_red(tl, x0, tr)
   where tl and tr are red-black trees,
   and bheight(tl) = bheight(tr), and
   both tl and tr are black (note that a
   tree is considered black if it is empty)
//
*)
(* ****** ****** *)
//
// HX: 15 points
// [myrbtree_isrbt] tests
// whether a given tree is a valid
// red-black tree. Please implement
// [myrbtree_isrbt] in such a manner
// that the implementation only traverses
// the given tree at most ONLY.
//
// Please see the implementation of [isAVL3]
// for a hint.
//
extern
fun
{a:t@ype}
myrbtree_isrbt(t0: myrbtree(a)): bool

(* ****** ****** *)
(*
//
// Points: 20
//
// Please implement
// the following function that enumerates
// all the pairs of positive numbers (i, j)
// satisfying i <= j such that a pair (i1, j1)
// is required to appear ahead of another pair
// (i2, j2) whenever i1^3+j1^3 <= i2^3+j2^3 holds
//
*)
//
typedef int2 = (int, int)
//
extern
fun{}
intpair_enumorder((*void*)): stream(int2)
//
(* ****** ****** *)

(* end of [assign04.dats] *)
