
fun
partsum
( xs
: stream(int)
)
: stream(int) =
auxmain(xs, 0(*sum*)) where
{
fun
auxmain
( xs
: stream(int), psum: int): stream(int) =
$delay
(
case- !xs of
| stream_cons(x0, xs) =>
  stream_cons(psum, auxmain(xs, psum + x0))
)
}