(* ****** ****** *)
(*
For testing midterm1
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../..\
/mylib/SATS/mylib.sats"
#staload _ =
"./../..\
/mylib/DATS/mylib.dats"
(* ****** ****** *)
//
#staload "./../midterm1.dats"
//
(* ****** ****** *)
(*
exception
LastPermException of ()
*)
(* ****** ****** *)

val _Q5_ =
{
//
val xs =
mylist_nil()
val xs =
mylist_cons(1, xs)
val xs =
mylist_cons(2, xs)
val xs =
mylist_cons(3, xs)
val xs =
mylist_cons(4, xs)
val xs =
mylist_cons(5, xs)
//
val xs = mylist_reverse(xs)
//
val ys = xs
val () = println!("ys = ", ys)
val ys = permute_next(ys)
val () = println!("ys = ", ys)
val ys = permute_next(ys)
val () = println!("ys = ", ys)
val ys = permute_next(ys)
val () = println!("ys = ", ys)
val ys = permute_next(ys)
val () = println!("ys = ", ys)
val ys = permute_next(ys)
val () = println!("ys = ", ys)
//
val zs = permute_next(mylist_reverse(xs))
//
val () = println!("zs = ", zs)
//
} (*where*) // end of [val _Q5_]

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_Q5_test.dats] *)
