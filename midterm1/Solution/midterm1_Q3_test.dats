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
implement
mylist_submaxord
(xs) =
(
case+ xs of
|
mylist_nil() =>
mylist_nil()
|
mylist_cons(x1, xs) =>
let
//
val
xs1 = xs
val
ys1 =
mylist_submaxord(xs1)
//
val
xs2 =
mylist_filter
( xs
, lam(x2) => (x1 <= x2))
//
val ys2 =
mylist_cons
(x1, mylist_submaxord(xs2))
//
in
if
mylist_length(ys1)
>
mylist_length(ys2) then ys1 else ys2
end
) (* end of [mylist_submaxord] *)
(* ****** ****** *)
#define
:: mylist_cons
#define
nil mylist_nil
#define
cons mylist_cons
(* ****** ****** *)

val _Q3_ =
{
val xs = 1::3::2::4::nil()
val ys = mylist_submaxord(xs)
val () = println!("xs = ", xs)
val () = println!("ys = ", ys)
val () = println!("[ys] should be (1, 3, 4)")
val xs = (~1)::3::2::2::4::nil()
val ys = mylist_submaxord(xs)
val () = println!("xs = ", xs)
val () = println!("ys = ", ys)
val () = println!("[ys] should be (~1, 2, 2, 4)")
val xs = 4::1::2::1::3::8::9::5::6::7::1::1::1::1::1::nil()
val ys = mylist_submaxord(xs)
val () = println!("xs = ", xs)
val () = println!("ys = ", ys)
val () = println!("[ys] should be (1, 1, 1, 1, 1, 1, 1)")
} (*where*) // end of [val _Q3_]

(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [midterm1_Q3_test.dats] *)
