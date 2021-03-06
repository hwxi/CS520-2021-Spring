(* ****** ****** *)

#staload
"./../..\
/mylib/SATS/mylib.sats"

(* ****** ****** *)

(*
5 points for
implementing mylist_append
which is declared in mylib.sats
*)
(*
implement
{a}(*tmp*)
mylist_append(xs, ys) = ...
*)

(* ****** ****** *)

(*
5 points for
implementing mylist_rappend,
which is declared in mylib.sats
*)
(*
implement
{a}(*tmp*)
mylist_rappend(xs, ys) = ...
*)

(* ****** ****** *)
//
(*
A matrix is represented as a
list of lists, where the length
of each element list equals some
given integer ncol.
*)
//
datatype
matrix(a:t@ype) = // row-major
MATRIX of
( mylist(mylist(a)), int(*ncol*) )
//
(* ****** ****** *)

extern
fun
{a:t@ype}
matrix_get_nrow(M: matrix(a)): int
extern
fun
{a:t@ype}
matrix_get_ncol(M: matrix(a)): int

(* ****** ****** *)

implement
{a}(*tmp*)
matrix_get_nrow(M) =
(
case+ M of
MATRIX(xss, ncol) =>
mylist_length<mylist(a)>(xss)
)

implement
{a}(*tmp*)
matrix_get_ncol(M) =
(
case+ M of MATRIX(xss, ncol) => ncol
)

(* ****** ****** *)

extern
fun
{a:t@ype}
print_matrix(M: matrix(a)): void
extern
fun
{a:t@ype}
fprint_matrix
(out: FILEref, M: matrix(a)): void

#symload print with print_matrix
#symload fprint with fprint_matrix

(* ****** ****** *)
implement
{a}
print_matrix(M) =
fprint_matrix(stdout_ref, M)
(* ****** ****** *)
implement
{a}
fprint_matrix(out, M) =
let
val+
MATRIX(xss, ncol) = M
in
mylist_foreach<mylist(a)>
(xss, lam (xs) => fprintln!(out, xs))
end // end of [fprint_matrix]
(* ****** ****** *)
//
(*
Given M of the form MATRIX(xss, ncol),
the function matrix_validate checks if
the length of each element list in xss
equals ncol.
*)
//
extern // 5 points
fun
{a:t@ype}
matrix_validate(M: matrix(a)): bool
//
(* ****** ****** *)
//
(*
Given a matrix M, matrix_transpose(M)
return the transpose of M.
*)
extern
fun
{a:t@ype} // 15 points
matrix_transpose(M: matrix(a)): matrix(a)
//
(* ****** ****** *)

(* end of [assign02.dats] *)
