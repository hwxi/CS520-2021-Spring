#include
"share/atspre_staload.hats"

// 42; ...
// foo; bar; baz; ...

fun
foo(n: int): int =
(
  0
) where
{
  val n = n + 1
  val n2 = n * n
}

fun
foo(n: int): int =
let
  val n1 = n + 1
  val n2 = n * n
  fun bar(x: int): int = x + n + n1 + n2
in
  bar(n)
end

val _ = foo(5) // Yes!
// val _ = bar(5) // WRONG!!!

fun
f91(x: int): int =
if
x > 100
// outer f91 is a tail-call
then x - 10 else f91(f91(x+11))

(* ****** ****** *)

(* end of [notes.dats] *)
