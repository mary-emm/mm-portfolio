library(arrow)
library(dplyr)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

files <- c(
  saluran_ballots_jhr_se16 = "https://lake.electiondata.my/results_saluran/jhr_se16_ballots.parquet",
  saluran_ballots_jhr_se15 = "https://lake.electiondata.my/results_saluran/jhr_se15_ballots.parquet",
  saluran_stats_jhr_se15   = "https://lake.electiondata.my/results_saluran/jhr_se16_stats.parquet",
  saluran_stats_jhr_se16   = "https://lake.electiondata.my/results_saluran/jhr_se15_stats.parquet",
  voter_roll_jhr_se15      = "https://lake.electiondata.my/voter_rolls/jhr_se16_2026.parquet",
  voter_roll_jhr_se16      = "https://lake.electiondata.my/voter_rolls/jhr_se15_2022.parquet"
)

for (name in names(files)) {
  dest <- file.path("data/raw", paste0(name, ".parquet"))
  if (!file.exists(dest)) download.file(files[[name]], dest, mode = "wb")
}