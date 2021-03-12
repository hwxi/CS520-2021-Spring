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
#define
:: mylist_cons
#define
nil mylist_nil
#define
cons mylist_cons
(* ****** ****** *)
//
val _Q4_ =
{
//
val xs =
mylist_nil{double}()
val ij =
mylist_maxdrawdown(xs)
val () = println!("xs = ", xs)
val () =
println!("ij = (", ij.0, ",", ij.1, ")")
//
val xs =
(15.0)::(13.0)::
(14.0)::(14.0)::(11.0)::(xs)
val ij =
mylist_maxdrawdown(xs)
val () = println!("xs = ", xs)
val () =
println!("ij = (", ij.0, ",", ij.1, ")")
//
val xs =
(15.0)::(2.0 )::(2.0 )::
(14.0)::(14.0)::(16.5)::(xs)
val ij =
mylist_maxdrawdown(xs)
val () = println!("xs = ", xs)
val () =
println!("ij = (", ij.0, ",", ij.1, ")")
//
} (* end of [_Q4_] *)
//
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_Q4_test.dats] *)
