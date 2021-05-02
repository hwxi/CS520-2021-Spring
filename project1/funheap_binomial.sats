//
// Course: BU CAS CS 520, Fall, 2011
// Instructor: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
//

//
// Midterm Examination:
// implementing functional binomial heap
//

(* ****** ****** *)

#define ATS_STALOADFLAG 0 // no static loading at run-time

(* ****** ****** *)
//
abstype
heap_t0ype_type
( a:t@ype+ ) = ptr
//
stadef heap = heap_t0ype_type
//
(* ****** ****** *)
//
typedef
cmp
(a:t@ype) =
(a, a) -<cloref> Sgn
//
fun{a:t@ype}
compare_elt_elt
(x1: a, x2: a, cmp: cmp a): Sgn
//
(* ****** ****** *)

fun{}
funheap_make_nil
{a:t@ype} ((*void*)): heap(a)

(* ****** ****** *)

fun{a:t@ype}
funheap_size (hp: heap a): size_t

(* ****** ****** *)

fun{a:t@ype}
funheap_insert
(t: &heap(a) >> _, x: a, cmp: cmp a): void

(* ****** ****** *)

fun{a:t@ype}
funheap_delmin
( t: &heap(a) >> _, res: &a? >> opt (a, b), cmp: cmp a
) : #[b:bool] bool b // end of [funheap_delim]

(* ****** ****** *)

(* end of [funheap_binomial.sats] *)
