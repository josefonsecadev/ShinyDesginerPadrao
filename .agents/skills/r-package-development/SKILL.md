---
name: r-package-development
description: R package development with devtools, testthat, and roxygen2. Use when the user is working on an R package, running tests, writing documentation, or building package infrastructure.
metadata:
  author: Simon P. Couch (@simonpcouch)
  version: "1.2"
---

# R package development

## Key commands

```
# Run code in the package
Rscript -e "devtools::load_all(); code"

# Run all tests
Rscript -e "devtools::test()"

# Run all tests for files starting with {name}
Rscript -e "devtools::test(filter = '^{name}')"

# Run all tests for R/{name}.R
Rscript -e "devtools::test_active_file('R/{name}.R')"

# Run a single test "blah" for R/{name}.R
Rscript -e "devtools::test_active_file('R/{name}.R', desc = 'blah')"

# Redocument the package
Rscript -e "devtools::document()"

# Check pkgdown documentation
Rscript -e "pkgdown::check_pkgdown()"

# Check the package with R CMD check
Rscript -e "devtools::check()"

# Format changed R files
air format R/changed-file.R
```

## Coding

* Format only the R files changed by the task with `air format <files>`. Inspect the diff and preserve unrelated user edits. Format the entire repository only when that is explicitly in scope; report when the formatter is unavailable.
* Use the base pipe operator (`|>`) not the magrittr pipe (`%>%`).
* Use `\() ...` for single-line anonymous functions. For all other cases, use `function() {...}`.

## Testing

- Tests for `R/{name}.R` go in `tests/testthat/test-{name}.R`.
- Add meaningful behavior or regression tests in proportion to risk. Do not create tests that only mirror implementation or wording for reversible, low-impact changes.
- If there are existing tests, place new tests next to similar existing tests.
- Strive to keep tests minimal with few comments.
- Avoid `expect_true()` and `expect_false()` in favour of a specific expectation which will give a better failure message.
- For error and warning behavior, prefer `expect_error()` or `expect_warning()` with a specific condition class when available, or a focused message pattern. Use snapshots when the complete user-facing text or complex output is part of the contract. Follow `testing-r-packages` when designing or reviewing tests.

## Documentation

- Every user-facing function should be exported and have roxygen2 documentation.
- Wrap roxygen comments at 80 characters.
- Internal functions should not have roxygen documentation.
- Whenever you add a new (non-internal) documentation topic, also add the topic to `_pkgdown.yml`.
- Always re-document the package after changing a roxygen2 comment.
- Use `pkgdown::check_pkgdown()` to check that all topics are included in the reference index.

## `NEWS.md`

- Every user-facing change should be given a bullet in `NEWS.md`. Do not add bullets for small documentation changes or internal refactorings.
- Each bullet should briefly describe the change to the end user.
- If the change is related to a function, put the name of the function early in the bullet.
- If the bullet is related to a GitHub issue or pull request, reference it by number in parentheses before the final period: `(#123).`.
- Order bullets alphabetically by function name. Put all bullets that don't mention function names at the beginning.
