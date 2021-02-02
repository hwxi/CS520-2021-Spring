(* ****** ****** *)
#include
"share\
/atspre_staload.hats"
(* ****** ****** *)

#staload
"./../SATS/mylib.sats"
#staload _ =
"./../DATS/mylib.dats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

val () =
println!
("Welcome to [mylib_test]!")

(* ****** ****** *)

val xs = mylist_nil{int}()
val xs = mylist_cons{int}(3, xs)
val xs = mylist_cons{int}(2, xs)
val xs = mylist_cons{int}(1, xs)
(*
val () =
println!
( "length(3) = "
, mylist_length<int>(xs))
*)
val () =
println!("xs = ", xs)
val () =
assertloc(3 = mylist_length<int>(xs))
(* ****** ****** *)
(*
val ys =
mylist_reverse<int>(xs)
val () =
println!("ys = ", ys)
val () =
assertloc(3 = mylist_length<int>(ys))
*)
(* ****** ****** *)

(* end of [mylib_test.dats] *)
