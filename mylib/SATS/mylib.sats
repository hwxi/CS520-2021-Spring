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
mylist_foreach
( xs: mylist(a)
, f0: (a) -<cloref1> void): void
//
(* ****** ****** *)

(* end of [mylib.sats] *)
