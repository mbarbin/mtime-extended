# mtime-extended

[![CI Status](https://github.com/mbarbin/mtime-extended/workflows/ci/badge.svg)](https://github.com/mbarbin/mtime-extended/actions/workflows/ci.yml)
[![Deploy odoc Status](https://github.com/mbarbin/mtime-extended/workflows/deploy-odoc/badge.svg)](https://github.com/mbarbin/mtime-extended/actions/workflows/deploy-odoc.yml)

This library adds a few functions to the
[mtime](https://opam.ocaml.org/packages/mtime/) package to be use by projects
using [base](https://opam.ocaml.org/packages/base/).

## Usage

The intended usage is to refer to the module `Mtime_extended` alongside `Mtime`
for the needed bits, and keep on simply using `Mtime` as usual when no extended
functionality is required.

For example, Mtime_extended adds a sexp serializer to `Mtime.Span.t`, thus
allowing for example:

```ocaml file=example.ml
open! Base

type my_type_using_spans =
 { span1 : Mtime_extended.Span.t
 ; span2 : Mtime_extended.Span.t
 }
[@@deriving sexp_of]
```

and in the mli

```ocaml file=example.mli
open! Base

type my_type_using_spans =
 { span1 : Mtime.Span.t
 ; span2 : Mtime.Span.t
 }
[@@deriving sexp_of]
```

## Motivations

This experimental package is not meant to be published to the opam repository,
nor is it meant for public consumption.

Really, I've just used this package as an excuse to toy with opam and experiment
with some ways extension packages may be designed and distributed.

The repo itself is public so that I can publish its releases into my personal
[opam-repository](https://github.com/mbarbin/opam-repository), install them in
my local opam switches and refer to these packages from the workflow actions of
other repos.
