(** Adding a few functions to [Mtime.Span], such as:

    - human readable serializers based on [Core.Time_ns.Span]
    - sexp serializer
    - a few function to create a span from us, ms, and sec
    - etc. *)

type t = Mtime.Span.t [@@deriving compare, equal, sexp]

val to_string_hum : t -> string

(** Divide by a given integer, e.g. to compute a mean span from a total of spans
    accumulated over several executions. *)
val divide : t -> by:int -> t

val to_ms : t -> float

(** Build from a number of small units *)

val of_us : float -> t
val of_ms : float -> t
val of_sec : float -> t
