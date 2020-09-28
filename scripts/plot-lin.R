df_lin <- data.frame(day, total_cases = work$total_cases) 
fm_lin <- lm(total_cases ~ day, data = df_lin)

dev.off()
plot(df_lin$day, df_lin$total_cases)
lines(df_lin$day, fm_lin$fitted.values)

