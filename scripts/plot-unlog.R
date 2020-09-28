fitted_values_exp2 <- exp(fm_exp$fitted.values)

dev.off()
plot(day, work$total_cases)
lines(day, fitted_values_exp2)

