## 2.0.0-extension.17.1 (2024-09-08)

### Added

- Configure `with-dev-setup` dependencies - attached to test package only.

### Changed

- Split test package.
- Use `expect_test_helpers_core.expect_test_helpers_base`.

## 2.0.0-extension.17.0 (2024-07-26)

### Added

- Added dependabot config for automatically upgrading action files.

### Changed

- Upgrade `ppxlib` to `0.33` - activate unused items warnings.
- Upgrade `ocaml` to `5.2`.
- Upgrade `dune` to `3.16`.
- Upgrade base & co to `0.17`.

## 2.0.0-extension.16.3 (2024-03-13)

### Changed

- Uses `expect-test-helpers` (reduce core dependencies)
- Run `ppx_js_style` as a linter & make it a `dev` dependency.
- Upgrade GitHub workflows `actions/checkout` to v4.
- In CI, specify build target `@all`, and add `@lint`.
- List ppxs instead of `ppx_jane`.

## 2.0.0-extension.16.2 (2024-02-14)

### Changed

- Upgrade dune to `3.14`.
- Build the doc with sherlodoc available to enable the doc search bar.

## 2.0.0-extension.16.1 (2024-02-09)

### Added

- Setup `bisect_ppx` for test coverage.

### Changed

- Internal changes related to the release process.
- Upgrade dune and internal dependencies.

## 2.0.0-extension.16.0 (2024-01-18)

### Changed

- Internal changes related to build and release process.
- Generate opam file from `dune-project`.

## 2.0.0-extension.0.2 (2023-11-01)

### Changed

- Change changelog format to be closer to dune-release's.
- Now building distribution with `dune-release`.

## 2.0.0-extension.0.1 (2023-10-31)

Initial version based on mtime 2.0.0

### Added

- Span module with sexps and a few functions to build spans from floats
