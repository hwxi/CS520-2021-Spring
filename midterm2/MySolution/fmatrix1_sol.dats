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

local

absimpl
fmatrix1(m, n) =
mylist1(mylist1(double, n), m)

in(* in-of-local*)
//
// Please
// implmenent [fmatrix1_remove_row] here
// Please
// implmenent [fmatrix1_remove_col] here
//
// Please implement [fmatrix1_get_at] here
//
end // end of [local]

(* ****** ****** *)
//
// Please implement [fmatrix1_eval_det] below
//
(* ****** ****** *)

(* end of [fmatrix1.dats] *)
