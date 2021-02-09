
#include
"share/atspre_staload.hats"
#staload
"./../../mylib/SATS/mylib.sats"

implement main0() = ()


fun
from
( i: int ): mylist(int) = mylist_cons(i, from(i+1))

fun
fromto
( i: int
, j: int): mylist(int) =
if
(i < j)
then mylist_cons(i, fromto(i+1, j)) else mylist_nil()

fun
from
( i: int ): stream(int) = $delay(stream_cons(i, from(i+1)))

val theNats = from(0)

val xs = theNats

val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-
stream_cons(x, xs) = !xs
val () = println!("x = ", x)

