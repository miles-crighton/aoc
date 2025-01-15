let ic = open_in "./inputs/01-prod.txt" in
try
  let line = input_line ic in
  let line2 = String.to_seq line in
  Seq.iter (fun c -> print_char c) line2;
  (* print_endline line; *)
  flush stdout;
  close_in ic
with
| e ->
  close_in_noerr ic;
  raise e
