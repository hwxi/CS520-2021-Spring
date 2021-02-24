(* ****** ****** *)
(*
For testing assign04
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
#staload "./../assign04.dats"
//
(* ****** ****** *)
// (*
#staload
"./..\
/Solution/assign04_sol.dats"
// *)
(* ****** ****** *)
(*
#staload
"./..\
/MySolution/assign04_sol.dats"
*)
(* ****** ****** *)

implement main0() = { (*nothing-to-do*) }

(* ****** ****** *)

(* end of [assign04_test.dats] *)
