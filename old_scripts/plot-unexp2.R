fitted_values_exp2 <- exp(fm_exp2$fitted.values)

dev.off()
plot(day, work$total_cases)
lines(day, fitted_values_exp2)

