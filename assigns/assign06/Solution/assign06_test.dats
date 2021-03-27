(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload "./../assign06.dats"
(* ****** ****** *)
#staload _ =
"./../../../mylib/DATS/mylib.dats"
(* ****** ****** *)

val xs = mylist1_nil{int}()
val xs = mylist1_cons(5, xs)
val xs = mylist1_cons(4, xs)
val xs = mylist1_cons(3, xs)
val xs = mylist1_cons(2, xs)
val xs = mylist1_cons(1, xs)
val xs = mylist1_to_ralist1(xs)

(* ****** ****** *)
//
implement
main0() =
{
  val () = println!("xs = ", xs)
}
//
(* ****** ****** *)

(* end of [assign06_test.dats] *)
