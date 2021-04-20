(* ****** ****** *)
// HX: 50 bonus points
(* ****** ****** *)
//
// 2D-matrix of doubles
// m: number of rows
// n: number of columns
//
abstype
fmatrix1(m:int, n:int) = ptr
//
(*
Please
implement
fmatrix1(m, n) as
mylist1(mylist1(double, n), m)
*)
//
(* ****** ****** *)
//
// HX: 10 points
//
extern
fun
fmatrix1_get_at
{m,n:int}
{i,j:nat | i < m; j < n}
(fmatrix1(m, n), i: int i, j: int j): double
//
overload [] with fmatrix1_get_at
//
(* ****** ****** *)
//
// HX: 10 points
//
extern
fun
fmatrix1_remove_row
{m,n:int}
{i:nat | i < m}
(M: fmatrix1(m, n), nrow: int(i)): fmatrix1(m-1, n)
//
// HX: 10 points
//
extern
fun
fmatrix1_remove_col
{m,n:int}
{j:nat | j < n}
(M: fmatrix1(m, n), ncol: int(j)): fmatrix1(m, n-1)
//
(* ****** ****** *)
//
// HX: 20 points
//            
//
// Please implement the following function based on the
// above ones:
//
extern
fun
fmatrix1_eval_det
{n:int | n >= 1}(M: fmatrix1(n, n), n: int(n)): double
//
// which evaluates the determinant of a given square matrix M
// of dimension n by n.
// See http://en.wikipedia.org/wiki/Determinant for the definition
// of the determinant of a square matrix and the Laplace's formula
// for computing its determinant.
//
(* ****** ****** *)

(* end of [fmatrix1.dats] *)
