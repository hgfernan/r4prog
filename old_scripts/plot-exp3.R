day_sq <- day * day
day_cub <- day * day * day
df_exp3 <- data.frame(day, day_sq, day_cub, total_cases_log)
fm_exp3 <- lm(total_cases_log ~ day + day_sq + day_cub, data = df_exp3)

dev.off()
plot(df_exp3$day, df_exp3$total_cases_log)
lines(df_exp3$day, fm_exp3$fitted.values)

