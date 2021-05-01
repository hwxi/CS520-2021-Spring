//
// Course: BU CAS CS 520, Fall, 2011
// Instructor: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
//

//
// Midterm Examination:
// implementing linear binomial heap
//

(* ****** ****** *)

#define ATS_STALOADFLAG 0 // no static loading at run-time

(* ****** ****** *)

absviewtype
heap_viewt0ype_viewtype(a:viewt@ype+)
stadef heap = heap_viewt0ype_viewtype

(* ****** ****** *)

sortdef vt0p = viewt@ype

(* ****** ****** *)
//
typedef
cmp(a:vt0p) =
(&a, &a) -<cloref> Sgn
//
fun{a:vt0p}
compare_elt_elt
(x1: &a, x2: &a, cmp: cmp a): Sgn
//
(* ****** ****** *)

fun{}
linheap_make_nil
{a:vt0p}((*void*)): heap (a)

(* ****** ****** *)

fun{a:vt0p}
linheap_size (hp: !heap a): size_t

(* ****** ****** *)

fun{a:vt0p}
linheap_insert
(hp: &heap(a) >> _, x: a, cmp: cmp a): void

(* ****** ****** *)

fun{a:vt0p}
linheap_delmin
( hp: &heap(a) >> _
, res: &a? >> opt (a, b), cmp: cmp a
) : #[b:bool] bool b // end of [linheap_delim]

(* ****** ****** *)

(* end of [linheap_binomial.sats] *)
