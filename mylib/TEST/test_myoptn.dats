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
("Welcome to [myoptn_test]!")

(* ****** ****** *)

#define none myoptn_nil
#define some myoptn_cons

fun
mydiv
(x: int, y: int): myoptn(int) =
if y != 0
then myoptn_cons(x / y) else myoptn_nil()

val-none() = mydiv(1, 0)

(* ****** ****** *)

(* end of [myoptn_test.dats] *)
