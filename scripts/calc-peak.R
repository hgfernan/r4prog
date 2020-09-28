peak <- -fm_exp2$coefficients["day"] / (2 * fm_exp2$coefficients["day_sq"])
peak

peak <- ceiling(peak)
peak

work$date[peak]
