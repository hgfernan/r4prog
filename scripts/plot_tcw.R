nweek <- 1
tcw <- 0
for (i in 1:length(work$total_cases)) {
  tcw[nweek] <- tcw[nweek] + work$total_cases[i]
  if ((i %% 7) == 0) {
    tcw[nweek] <- tcw[nweek] / 7
    nweek <- nweek + 1
    tcw[nweek] <- 0
  }
}

remainder = length(work$total_cases)
if ((remainder %% 7) != 0){
  tcw[nweek] <- tcw[nweek] / remainder
}

week <- 1:length(tcw)

# dev.off()
plot(week, tcw)