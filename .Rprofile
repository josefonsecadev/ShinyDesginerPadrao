invisible(local({
  locale_variables <- c(
    "LC_ALL",
    "LC_CTYPE",
    "LC_COLLATE",
    "LC_MONETARY",
    "LC_TIME",
    "LANG"
  )
  locale_values <- Sys.getenv(locale_variables)
  uses_posix_utf8_locale <- any(grepl(
    "^C[.]UTF-?8$",
    locale_values,
    ignore.case = TRUE
  ))

  if (.Platform$OS.type == "windows" && uses_posix_utf8_locale) {
    Sys.unsetenv(locale_variables)
    Sys.setlocale("LC_ALL", "")
  }
}))
