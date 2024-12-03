let%expect_test "build and print" =
  let print t =
    print_endline (Mtime_extended.Span.to_string_hum t);
    print_s [%sexp (t : Mtime_extended.Span.t)]
  in
  print (Mtime_extended.Span.of_us 3.14);
  [%expect
    {|
    3.14us
    3.14us |}];
  print (Mtime_extended.Span.of_ms 114.857);
  [%expect
    {|
    114.857ms
    114.857ms |}];
  print (Mtime_extended.Span.of_sec 23.47);
  [%expect
    {|
    23.47s
    23.47s |}];
  ()
;;

(* In practice (Span.of_sec 8.2) was not serialized as the sexp [8.2s], but
   rather [8.199999999s]. Monitoring to avoid a regression. *)

let%expect_test "span.sexp" =
  let print t =
    print_s
      [%sexp
        { to_string_hum = (Mtime_extended.Span.to_string_hum t : string)
        ; t : Mtime_extended.Span.t
        }]
  in
  print (Sexp.Atom "8.2s" |> [%of_sexp: Mtime_extended.Span.t]);
  [%expect
    {|
    ((to_string_hum 8.2s)
     (t             8.2s)) |}];
  print (Mtime_extended.Span.of_sec 8.2);
  [%expect
    {|
    ((to_string_hum 8.2s)
     (t             8.2s)) |}];
  ()
;;

let%expect_test "divide" =
  let t = Mtime_extended.Span.of_sec 23.47 in
  let mean = Mtime_extended.Span.divide t ~by:10 in
  print_endline (mean |> Mtime_extended.Span.to_string_hum);
  [%expect {| 2.347s |}];
  (* Let's register here too how [Mtime] prints it. *)
  Stdlib.Format.printf "%a%!" Mtime.Span.pp mean;
  [%expect {| 2.35s |}];
  print_endline (Mtime_extended.Span.to_ms mean |> Float.to_string);
  [%expect {| 2347. |}];
  ()
;;
