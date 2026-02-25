using Plots

#duration of 10,000
input_spin      = [0, 0.35, 0.5, 0.75, 0.85, 0.9]
fitted_spin  = [1.60920E-02,0.315973, 0.509117, 0.602346,  0.596378, 0.706655]
error_low       = [0, 0.135667, 0.065933, 0.051099, 0.098541,0.088546]
error_high      = [0.105997, 0.060933, 0.06801, 0.102205, 0.124092, 0.079162]  








# error matrix
y_err = [error_low error_high]

scatter(input_spin, fitted_spin;
    yerr = y_err,
    xlabel = "True Spin",
    ylabel = "Fitted Spin",
    title = "Fitted vs Real Spin for duration: 10,000",
    color = :blue,
    markersize = 2,
    legend = false
)

#line obf
plot!([0, 1], [0, 1], linestyle = :dash, color = :red)