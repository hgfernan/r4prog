total_cases_log = log(df$total_cases)
df_exp <- data.frame(day = df$day, total_cases = total_cases_log)
