day_log <- log(df$day)
total_cases_log = log(df$total_cases)
df_log <- data.frame(day = day_log, total_cases = total_cases_log)
