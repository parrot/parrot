( define (compile-program x)
  (emit ".sub main :main")
  (emit "say ~a" x)
  (emit ".end"))
