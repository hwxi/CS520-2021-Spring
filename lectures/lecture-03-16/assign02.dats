(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

datatype
mylist1(a:t@ype, int) =
|
mylist1_nil(a, 0) of ()
|
{n:nat}
mylist1_cons(a, n+1) of (a, mylist1(a, n))

(* ****** ****** *)
//
(*
A matrix is represented as a
list of lists, where the length
of each element list equals some
given integer ncol.
*)
//
// row-major
//
datatype
matrix1(a:t@ype, int, int) =
|
{m,n:nat | m > 0}
MATRIX1(a, m, n) of // 'm' by 'n'
(mylist1(mylist1(a, m), n), int(m), int(n))
//
typedef
matrix1(a:t@ype) = [m:int;n:int] matrix1(a, m, n)
//
(* ****** ****** *)
//
// int: sort
(*
typedef
pos(n:int) = [n > 0] int(n)
typedef
nat(n:int) = [n >= 0] int(n)
*)

(* ****** ****** *)

extern
fun
{a:t@ype}
matrix1_get_nrow
{m,n:int}
(M: matrix1(a, m, n)): int(m)
extern
fun
{a:t@ype}
matrix1_get_ncol
{m,n:int}
(M: matrix1(a, m, n)): int(n)

(* ****** ****** *)
//
implement
{a}(*tmp*)
matrix1_get_nrow(M) =
(
case+ M of
MATRIX1(xss, nrow, _) => nrow
)
//
implement
{a}(*tmp*)
matrix1_get_ncol(M) =
(
case+ M of
MATRIX1(xss, _, ncol) => ncol
)
//
(* ****** ****** *)

extern
fun
{a:t@ype}
print_matrix1(M: matrix1(a)): void
extern
fun
{a:t@ype}
fprint_matrix1
(out: FILEref, M: matrix1(a)): void

#symload print with print_matrix1
#symload fprint with fprint_matrix1

(* ****** ****** *)
implement
{a}
print_matrix1(M) =
fprint_matrix1(stdout_ref, M)

(* ****** ****** *)
implement
{a}
fprint_matrix1(out, M) =
let
val+
MATRIX1
(xss, nrow, ncol) = M
in
(*
mylist1_foreach<mylist1(a)>
(xss, lam (xs) => fprintln!(out, xs))
*)
end // end of [fprint_matrix1]
(* ****** ****** *)
//
(*
Given M of the form MATRIX(xss, ncol),
the function matrix_validate checks if
the length of each element list in xss
equals ncol.
*)
//
(*
extern // 5 points
fun
{a:t@ype}
matrix_validate(M: matrix1(a)): bool
*)
//
(* ****** ****** *)
//
(*
Given a matrix M, matrix1_transpose(M)
return the transpose of M.
*)
extern
fun
{a:t@ype} // 15 points
matrix1_transpose
{m,n:int}
(M: matrix1(a, m, n)): matrix1(a, n, m)
//
(* ****** ****** *)

(* end of [assign02.dats] *)
