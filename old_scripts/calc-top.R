url <- "https://github.com/owid/covid-19-data/raw/master/public/data/owid-covid-data.csv"
full_data <- read.csv(url, header=TRUE)

brazil <- subset(full_data, iso_code == 'BRA')
work   <- subset(brazil, total_cases > 0)

day <- 1:length(work$total_cases)
total_cases_log <- log(work$total_cases)

day_sq <- day * day
df_exp2 <- data.frame(day, day_sq, total_cases_log)
fm_exp2 <- lm(total_cases_log ~ day + day_sq, data = df_exp2)

str(fm_exp2$coefficients)

peak <- -fm_exp2$coefficients["day"] / (2 * fm_exp2$coefficients["day_sq"])
peak

peak <- ceiling(peak)
peak

work$date[peak]

# summary(fm_exp2)
