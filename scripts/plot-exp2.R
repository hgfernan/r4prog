day_sq <- day * day
df_exp2 <- data.frame(day, day_sq, total_cases_log)
fm_exp2 <- lm(total_cases_log ~ day + day_sq, data = df_exp2)

dev.off()
plot(df_exp2$day, df_exp2$total_cases_log)
lines(df_exp2$day, fm_exp2$fitted.values)

