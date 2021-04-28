(* ****** ****** *)
// HX: 5 points
(* ****** ****** *)
#staload "./../fmatrix1.dats"
(* ****** ****** *)
//
datatype
mylist1(a:t@ype, int) =
|
mylist1_nil(a, 0) of ()
|
{n:nat}
mylist1_cons(a, n+1) of (a, mylist1(a, n))
//
(* ****** ****** *)
//
extern
fun
fmatrix1_make
{m,n:int}
( xss
: mylist1
  (mylist1(double, n), m)): fmatrix1(m, n)
//
(* ****** ****** *)

local

absimpl
fmatrix1(m, n) =
mylist1(mylist1(double, n), m)

in(* in-of-local*)
//
implement fmatrix1_make(xss) = xss
//
// Please
// implmenent [fmatrix1_remove_row] here
// Please
// implmenent [fmatrix1_remove_col] here
//
// Please implement [fmatrix1_get_at] here
//
implement
fmatrix1_get_at(M, i, j) = M[i,j]
//
end // end of [local]

(* ****** ****** *)
//
// Please implement [fmatrix1_eval_det] below
//
(* ****** ****** *)

(* end of [fmatrix1.dats] *)
