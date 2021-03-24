(* ****** ****** *)
(*
mylib for
CS520, Spring, 2021
*)
(* ****** ****** *)
//
datatype
myoptn(a:t@ype) =
|
myoptn_nil of ()
|
myoptn_cons of (a)
//
(* ****** ****** *)
//
datatype
mylist(a:t@ype) =
|
mylist_nil of ()
|
mylist_cons of (a, mylist(a))
//
(* ****** ****** *)

fun
{a:t@ype}
print_myoptn
(xs : myoptn(a)): void
fun
{a:t@ype}
fprint_myoptn
(out: FILEref, xs : myoptn(a)): void

#symload print with print_myoptn
#symload fprint with fprint_myoptn

(* ****** ****** *)
//
fun
{a:t@ype}
myoptn_length
( xs: myoptn(a) ): int
//
(* ****** ****** *)

fun
{a:t@ype}
print_mylist
(xs : mylist(a)): void
fun
{a:t@ype}
fprint_mylist
(out: FILEref, xs : mylist(a)): void

#symload print with print_mylist
#symload fprint with fprint_mylist

(* ****** ****** *)
//
fun
{a:t@ype}
mylist_length
( xs: mylist(a) ): int
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_append
( mylist(a), mylist(a) ): mylist(a)
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_concat
(xss: mylist(mylist(a))): mylist(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_reverse
( xs : mylist(a) ): mylist(a)
fun
{a:t@ype}
mylist_rappend
( mylist(a), mylist(a) ): mylist(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_equal
(mylist(a), mylist(a)): bool
//
#symload = with mylist_equal
//
(* ****** ****** *)
//
fun
{a:t@ype}
{b:t@ype}
mylist_map
( xs: mylist(a)
, f0: (a) -<cloref1> b): mylist(b)
fun
{a:t@ype}
{b:t@ype}
mylist_maprev
( xs: mylist(a)
, f0: (a) -<cloref1> b): mylist(b)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_filter
( xs: mylist(a)
, f0: (a) -<cloref1> bool): mylist(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_forall
( xs: mylist(a)
, f0: (a) -<cloref1> bool): bool
//
fun
{a:t@ype}
mylist_foreach
( xs: mylist(a)
, f0: (a) -<cloref1> void): void
//
(* ****** ****** *)
//
fun
{a:t@ype}
{r:t@ype}
mylist_foldleft
( xs: mylist(a)
, r0: r
, f0: (r, a) -<cloref1> r): ( r )
//
(* ****** ****** *)
//
fun
{a:t@ype}
{r:t@ype}
mylist_foldright
( xs: mylist(a)
, r0: r
, f0: (a, r) -<cloref1> r): ( r )
//
(* ****** ****** *)

fun
{a:t@ype}
{b:t@ype}
mylist_xprod2
( xs: mylist(a)
, ys: mylist(b)): mylist(@(a, b))

(* ****** ****** *)
//
fun
{a:t@ype}
mylist_mergesort
( xs: mylist(a)
, cmp: (a, a) -<cloref1> int): mylist(a)
//
(* ****** ****** *)

typedef
mystrm(a:t@ype) = stream(a)

(* ****** ****** *)
//
fun
{a:t@ype}
{b:t@ype}
mystrm_map
( xs: mystrm(a)
, f0: (a) -<cloref1> b): mystrm(b)
//
(*
fun
{a:t@ype}
{b:t@ype}
mystrm_maprev? // No need for it!!!
( xs: mystrm(a)
, f0: (a) -<cloref1> b): mystrm(b)
*)
(* ****** ****** *)
//
fun
{a:t@ype}
mystrm_filter
( xs: mystrm(a)
, f0: (a) -<cloref1> bool): mystrm(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mystrm_append
( xs: mystrm(a)
, ys: mystrm(a)): mystrm(a)
//
fun
{a:t@ype}
mystrm_concat
( xss: mystrm(mystrm(a)) ) : mystrm(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mystrm_merge
( xs: mystrm(a)
, ys: mystrm(a)
, cmp: (a, a) -<cloref1> int): mystrm(a)
//
(* ****** ****** *)

vtypedef
mylstrm(a:t@ype) = stream_vt(a)

(* ****** ****** *)
//
fun
{a:t@ype}
mylstrm_filter
( xs: mylstrm(a)
, f0: (a) -<cloref1> bool): mylstrm(a)
//
(* ****** ****** *)

(* end of [mylib.sats] *)
