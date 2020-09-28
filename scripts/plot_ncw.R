nweek <- 1
ncw <- 0
for (i in 1:length(work$new_cases)) {
  ncw[nweek] <- ncw[nweek] + work$new_cases[i]
  if ((i %% 7) == 0) {
    ncw[nweek] <- ncw[nweek] / 7
    nweek <- nweek + 1
    ncw[nweek] <- 0
  }
}

remainder <- length(work$total_cases) %% 7
if (remainder != 0){
  ncw[nweek] <- ncw[nweek] / remainder
}

week <- 1:length(ncw)

dev.off()
plot(week, ncw)