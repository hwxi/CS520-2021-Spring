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
( mylist(a), mylist(a) ): void
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_reverse
( xs : mylist(a) ): void
fun
{a:t@ype}
mylist_rappend
( mylist(a), mylist(a) ): void
//
(* ****** ****** *)

(* end of [mylib.sats] *)
