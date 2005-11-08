.noGenerics <- TRUE
.conflicts.OK <- TRUE

.onLoad <- .First.lib <- function(lib, pkg)
{
  if("amap" %in% .packages(all=TRUE))
      require("amap")
}

