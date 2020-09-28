nweek <- 1
tw <- 0
for (i in 1:length(work$total_cases)) {
  tw[nweek] <- tw[nweek] + work$total_cases[i]
  if ((i %% 7) == 0) {
    tw[nweek] <- tw[nweek] / 7
    nweek <- nweek + 1
    tw[nweek] <- 0
  }
}

tw[nweek] <- tw[nweek] / (length(work$total_cases) %% 7)

week <- 1:length(tw)