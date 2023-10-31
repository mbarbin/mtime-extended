let%expect_test "hello" =
  print_s Mtime_extended.hello_world;
  [%expect {| "Hello, World!" |}]
;;
