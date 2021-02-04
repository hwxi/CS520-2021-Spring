(* ****** ****** *)
#include
"share\
/atspre_staload.hats"
#include
"share\
/atspre_staload_libats_ML.hats"
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
("Welcome to [mylist_test]!")

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

implement
{a}
mylist_rappend
(xs, ys) =
let
val xs =
$UNSAFE.cast{list0(a)}(xs)
val ys =
$UNSAFE.cast{list0(a)}(ys)
in
$UNSAFE.cast{mylist(a)}
(list0_reverse_append<a>(xs, ys))
end


val xs = mylist_nil{int}()
val xs = mylist_cons{int}(5, xs)
val xs = mylist_cons{int}(3, xs)
val xs = mylist_cons{int}(1, xs)
val ys = mylist_map<int><int>(xs, lam x0 => x0 * x0)
val () = println!("xs = ", xs)
val () = println!("ys = ", ys)

(* ****** ****** *)

val () =
(
println!("ys: ");
mylist_foreach<int>(ys, lam y0 => println!(y0))
)

(* ****** ****** *)

(* end of [mylist_test.dats] *)
