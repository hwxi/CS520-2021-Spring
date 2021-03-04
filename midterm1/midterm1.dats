(* ****** ****** *)
#staload
"./../mylib/SATS/mylib.sats"
(* ****** ****** *)
//
// HX: 20 points
//
(*
//
Given an infinite stream xss of infinite streams,
please implement stream_enumerate to enumerate *all*
the elements of the streams contained in xss.
//
Note that a valid solution should contain a brief
argument that explains clearly why all the elements
are eventually enumerated.
//
*)
extern
fun
{a:t@ype}
mystrm_enumerate(xss: mystrm(mystrm(a))): mystrm(a)
//
(* ****** ****** *)
//
datatype
mytree(a:t@ype) =
| mytree_sing of (a)
| mytree_pair of (mytree(a), mytree(a))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mytree_flatten(t0: mytree(a)): mylist(a)
//
(* ****** ****** *)
extern
fun
{a:t@ype}
mylist_sing(x: a): mylist(a)
implement
{a}(*tmp*)
mylist_sing(x) =
mylist_cons(x, mylist_nil())
(* ****** ****** *)
implement
{a}(*tmp*)
mytree_flatten
  (t0) =
(
case+ t0 of
| mytree_sing(x) => mylist_sing(x)
| mytree_pair(xs, ys) =>
  mylist_append
  (mytree_flatten(xs), mytree_flatten(ys))
)

(* ****** ****** *)
//
// HX: 20 points
//
// Given a list, list2mytrees returns a
// list of all of the mytree-values that
// can be flattend to the given list by a
// call to mytree_flatten
//
extern
fun
{a:t@ype}
list2mytrees(mylist(a)): mylist(mytree(a))
//
(* ****** ****** *)
//
// HX: 20 points
//
// Given a list xs of integers, the function
// [mylist_submaxord] returns the longest leftmost
// subsequence of xs that is ordered.
//
// If xs = (1, 3, 2, 4), then the result is (1, 3, 4)
// If xs = (~1, 3, 2, 2, 4), then the result is (~1, 2, 2, 4)
//
// If xs = (4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1), then the result is (1, 1, 1, 1, 1, 1, 1)
//
extern
fun
mylist_submaxord(xs: mylist(int)): mylist(int)
//
(* ****** ****** *)
//
// HX: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence
// does not exceed the first one. The value of
// a drawdown is the difference between its first
// number and last number. Please implement a
// function that returns the leftmost segment
// of a given list whose drawdown value is the largest
// among all of the drawdown segments of the given list.
// Note that a segment of a list is a consecutive
// portion of the list.
//
extern
fun
mylist_maxdrawdown(xs: mylist(double)): (int, int)
//
// Note that a segment is represented as a pair where
// the two integers are the indices of the first and
// last elements of the segment.
//
(* ****** ****** *)
//
// HX: 20 points
// Note that permutations of 1,2,...,n can be ordered
// lexicographically. For instance, we have
//
// (1, 2, 3) < (1, 3, 2) <
// (2, 1, 3) < (2, 3, 1) <
// (3, 1, 2) < (3, 2, 1)
//
// Given a permutation xs of 1,2,...,n, permute_next
// finds the next permutation immediately after xs or
// raises the LastPermException exception of xs is the
// last permutation (n, n-1, ..., 1). For instance,
// permute_next((2, 3, 1)) returns (3, 1, 2) but
// permute_next((3, 2, 1)) raises LastPermException.
//
exception LastPermException of ()
//
extern
fun
permute_next(xs: mylist(int)): mylist(int)
//
(* ****** ****** *)

(* end of [midterm1.dats] *)
