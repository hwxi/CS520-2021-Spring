(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload "./assign06.dats"
(* ****** ****** *)
#staload _ =
"./../../mylib/DATS/mylib.dats"
(* ****** ****** *)

val xs = mylist1_nil{int}()
val xs = mylist1_cons(5, xs)
val xs = mylist1_cons(4, xs)
val xs = mylist1_cons(3, xs)
val xs = mylist1_cons(2, xs)
val xs = mylist1_cons(1, xs)
// note: xs = [1, 2, 3, 4, 5]
val ys = mylist1_to_ralist1(xs)

(* ****** ****** *)

extern
prfun
lemma_mylist1
{a
:t@ype}
{n:int}(xs: mylist1(a, n)): [n >= 0] void

(* ****** ****** *)

extern
fun
{a:t@ype}
mylist1_length
{n:int}
(xs: mylist1(a, n)): int(n)

(* ****** ****** *)

implement
{a}
mylist1_length(xs) =
(
length(xs)
) where
{
fun
length
{n:int}
(xs: mylist1(a, n)): int(n) =
(
case+ xs of
| mylist1_nil() => 0
| mylist1_cons(_, xs) => 1 + length(xs)
)
}

// This is really BAD :(
implement
{a} // this is O(n*log(n))
ralist1_length(xs) =
mylist1_length<a>(ralist1_to_mylist1<a>(xs))

(* ****** ****** *)
//
implement
main0() =
{
  val () = println!("xs = ", xs)
  val () = println!("ys = ", ys)
//
  val () = println!("ys[0] = ", ys[0])
  val () = println!("ys[1] = ", ys[1])
  val () = println!("ys[2] = ", ys[2])
  val () = println!("ys[3] = ", ys[3])
  val () = println!("ys[4] = ", ys[4])
//
(*
  // HX: This one is out-of-bounds:
  val () = println!("ys[5] = ", ys[5])
*)
//
(*
  val () = println!("|xs| = ", mylist1_length(xs))
  val () = println!("|ys| = ", ralist1_length(ys))
*)
}
//
(* ****** ****** *)

(* end of [assign06_test.dats] *)
