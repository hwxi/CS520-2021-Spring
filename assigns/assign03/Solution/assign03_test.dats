(* ****** ****** *)
(*
For testing assign03
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../..\
/mylib/SATS/mylib.sats"
#staload _ =
"./../../..\
/mylib/DATS/mylib.dats"
(* ****** ****** *)
//
#staload "./../assign03.dats"
//
(* ****** ****** *)
// (*
#staload
"./..\
/MySolution/assign03_sol.dats"
// *)
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign03_test.dats] *)
