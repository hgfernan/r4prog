nweek <- 1
ndw <- 0
for (i in 1:length(work$new_deaths)) {
  ndw[nweek] <- ndw[nweek] + work$new_deaths[i]
  if ((i %% 7) == 0) {
    ndw[nweek] <- ndw[nweek] / 7
    nweek <- nweek + 1
    ndw[nweek] <- 0
  }
}

remainder <-length(work$new_deaths) %% 7
if (remainder != 0){
  ndw[nweek] <- ndw[nweek] / remainder
}

week <- 1:length(ndw)
df_all <- data.frame(week, ndw)
df_nonzero <- subset(df_all, ndw > 0)

# dev.off()
# plot(week, ndw)

ndw_log = log(df_nonzero$ndw)
week_sq = df_nonzero$week * df_nonzero$week
df_ndw_log = data.frame(week = df_nonzero$week, week_sq, ndw_log)

ndw_log_lm = lm(ndw_log ~ week + week_sq, data = df_ndw_log)

# dev.off()
plot(df_ndw_log$week, df_ndw_log$ndw_log)
lines(df_ndw_log$week, ndw_log_lm$fitted.values)
