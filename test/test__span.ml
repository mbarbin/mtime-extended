let%expect_test "build and print" =
  let print t =
    print_endline (Mtime_extended.Span.to_string_hum t);
    print_s [%sexp (t : Mtime_extended.Span.t)]
  in
  print (Mtime_extended.Span.of_us 3.14);
  [%expect {|
    3.14us
    3.14us |}];
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
  [%expect {|
    ((to_string_hum 8.2s)
     (t             8.2s)) |}];
  print (Mtime_extended.Span.of_sec 8.2);
  [%expect {|
    ((to_string_hum 8.2s)
     (t             8.2s)) |}];
  ()
;;
