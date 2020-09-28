nweek <- 1
tdw <- 0
for (i in 1:length(work$total_deaths)) {
  tdw[nweek] <- tdw[nweek] + work$total_deaths[i]
  if ((i %% 7) == 0) {
    tdw[nweek] <- tdw[nweek] / 7
    nweek <- nweek + 1
    tdw[nweek] <- 0
  }
}

remainder <-length(work$total_deaths)
if ((remainder %% 7) != 0){
  tdw[nweek] <- tdw[nweek] / remainder
}

week <- 1:length(tdw)

dev.off()
plot(week, tdw)