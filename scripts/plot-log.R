fm_log <- lm(total_cases ~ day, data = df_log)

dev.off()
plot(df_log$day, df_log$total_cases)
lines(df_log$day, fm_log$fitted.values)

