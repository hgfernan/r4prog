# Get all data
# url <- "https://github.com/owid/covid-19-data/raw/master/public/data/owid-covid-data.csv"
# full_data <- read.csv(url, header=TRUE)

# Filter for Brazil
# brazil <- subset(full_data, iso_code == 'BRA')

# Filter for total cases > 0
# work <- subset(brazil, total_cases > 0)

# TODO estimate half of the time span
time_span <- nrow(work)
# time_span

half_span <- floor(time_span / 2)
half_span

# Calculate the starting date
start <- as.Date(work$date[1])
str(start)

# Calculate the most recent date
finish <- as.Date(work$date[time_span])
finish

# Calculate the mid date
mid <- start + half_span
mid


# From the mid date to the last one, do
days       <- c(0)
oc_corr    <- c(0)
day_seq    <- c(0)
peak_day   <- c(0)
peak_date  <- c(Sys.Date())
peak_cases <- c(0) 

day_seq <- 1:half_span

for (day in 1:half_span) {
  # Subset to the current loop date
  days[day] <- day
  curr <- mid + (day - 1)
  # print(paste("Current date", curr))
  
  work_half <- subset(work, as.Date(date) <= curr)
  # print( paste("Length of work_half", nrow(work_half)) )
  
  # Fit the squared exponential model
  day_seq[day + half_span] <- day + half_span
  day_sqr <- day_seq * day_seq
  total_cases_log <- log(work_half$total_cases)
  
  df_exp2 <- data.frame(day_seq, day_sqr, total_cases_log)
  fm_exp2 <- lm(total_cases_log ~ day_seq + day_sqr, data = df_exp2)
  
  # Unlog the fitted value
  fitted_values_exp2 <- exp(fm_exp2$fitted.values)
  # print( paste("Length of fitted values", length(fitted_values_exp2)) )
  # print( paste("Length of observed values", length(work_half$total_cases)) )
  
  # Calculate the correlation between fitted & observed total cases
  oc_corr[day] <- cor(work_half$total_cases, fitted_values_exp2)
  
  # Calculate the peak date
  peak <- -fm_exp2$coefficients["day_seq"] / (2 * fm_exp2$coefficients["day_sqr"])

  peak_day[day] <- ceiling(peak)
  
  peak_date[day] <- work_half$date[peak]
  
  # Calculate the total cases value in the record
  peak_cases[day] <- work_half$total_cases[peak]
  
  # TODO calculate the total cases value in the model
}

# TODO plot days X peak date in days from pandemic start
# day_seq <- 1:half_span

# TODO plot days X estimated total cases
# TODO plot days X calculted total cases
# TODO plot days X distance from mid date
# TODO plot days X correlation between observed & calculated total cases

