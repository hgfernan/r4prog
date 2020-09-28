total_cases_log <- log(work$total_cases)
df_exp <- data.frame(day, total_cases_log)
fm_exp <- lm(total_cases_log ~ day, data = df_exp)

dev.off()
plot(df_exp$day, df_exp$total_cases_log)
lines(df_exp$day, fm_exp$fitted.values)

