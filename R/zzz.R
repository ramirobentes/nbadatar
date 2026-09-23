.onLoad <- function(libname, pkgname) {
  read_one <<- memoise::memoise(read_one)
}

