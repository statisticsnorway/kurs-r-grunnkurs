source("renv/activate.R")

# Auto-open RStudio project if available (robust)
if (interactive() && Sys.getenv("RSTUDIO") == "1") {
  # Kjør maks én gang per sesjon
  if (!identical(getOption("auto_open_rproj_done"), TRUE)) {
    options(auto_open_rproj_done = TRUE)

    # Sett opp stier
    repo <- tryCatch(normalizePath(dirname("/home/onyxia/work/kurs-r-grunnkurs/kurs-r-grunnkurs.Rproj"), mustWork = FALSE), error = function(e) NULL)

    if (requireNamespace("rstudioapi", quietly = TRUE) &&
        requireNamespace("later", quietly = TRUE)) {

      later::later(function() {
        if (rstudioapi::isAvailable()) {
          cur <- tryCatch(rstudioapi::getActiveProject(), error = function(e) NULL)
          cur_norm <- tryCatch(normalizePath(cur, mustWork = FALSE), error = function(e) NULL)

          # Åpne bare hvis vi IKKE allerede står i samme prosjektmappe
          if (!identical(cur_norm, repo)) {
            try(rstudioapi::openProject(repo, newSession = FALSE), silent = TRUE)
          }
        }
      }, delay = 0.5)
    }
  }
}



## AUTO: RStudio/Jupyter init ----
local_proj_dir <- normalizePath(".", mustWork = FALSE)
local_has_renv <- file.exists(file.path(local_proj_dir, "renv.lock")) ||
                  dir.exists(file.path(local_proj_dir, "renv"))
local_rproj    <- list.files(local_proj_dir, pattern = "[.]Rproj$", full.names = TRUE)
local_is_rstudio <- identical(Sys.getenv("RSTUDIO"), "1")
local_is_jupyter <- nzchar(Sys.getenv("JPY_PARENT_PID")) || nzchar(Sys.getenv("JUPYTERHUB_USER")) ||
                    !local_is_rstudio

# I Jupyter/ren R: setwd til prosjektkatalogen (kun hvis vi ikke allerede er der)
if (!local_is_rstudio) {
  proj <- tryCatch(normalizePath("/home/onyxia/work/kurs-r-grunnkurs", mustWork = FALSE), error = function(e) NULL)
  if (!is.null(proj) && dir.exists(proj)) {
    cur <- tryCatch(normalizePath(getwd(), mustWork = FALSE), error = function(e) NULL)
    if (!identical(cur, proj)) {
      try(setwd(proj), silent = TRUE)
    }
  }
}

# Aktiver renv hvis tilgjengelig
if (local_has_renv) {
  try({
    if (!"renv" %in% rownames(installed.packages())) install.packages("renv", repos = Sys.getenv("RENV_CONFIG_REPOS_OVERRIDE"))
    renv::activate()
  }, silent = TRUE)
}

# Åpne RStudio-prosjekt automatisk (kun i RStudio)
if (interactive() && local_is_rstudio) {
  if (!identical(getOption("auto_open_rproj_done"), TRUE)) {
    options(auto_open_rproj_done = TRUE)
    repo <- tryCatch(normalizePath(dirname("/home/onyxia/work/kurs-r-grunnkurs/kurs-r-grunnkurs.Rproj"), mustWork = FALSE), error = function(e) NULL)
    if (requireNamespace("rstudioapi", quietly = TRUE) &&
        requireNamespace("later", quietly = TRUE) &&
        !is.null(repo)) {
      later::later(function() {
        if (rstudioapi::isAvailable()) {
          cur <- tryCatch(rstudioapi::getActiveProject(), error = function(e) NULL)
          cur_norm <- tryCatch(normalizePath(cur, mustWork = FALSE), error = function(e) NULL)
          if (!identical(cur_norm, repo)) {
            try(rstudioapi::openProject(repo, newSession = FALSE), silent = TRUE)
          }
        }
      }, delay = 0.5)
    }
  }
}
## END AUTO ---------------------------------------------------------------

