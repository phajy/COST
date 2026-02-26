using Plots

#duration of 10,0000
input_spin      = [0, 0.35, 0.5, 0.75, 0.85, 0.9]
fitted_spin  = [1E-02,0.372, 0.538, 0.773, 0.842, 0.994]
error_low       = [NaN, 0.0193, 0.0389, 0.0132, 0.00234, 0.0028]
error_high      = [0.08, 0.0193, 0.0058, 0.0034, 0.02286, NaN]  # NaN for missing upper error

# error matrix
y_err = [error_low error_high]

scatter(input_spin, fitted_spin;
    yerr = y_err,
    xlabel = "True Spin",
    ylabel = "Fitted Spin",
    title = "Fitted vs Real Spin for duration: 100,000",
    color = :blue,
    markersize = 2,
    legend = false
)

#line obf
plot!([0, 1], [0, 1], linestyle = :dash, color = :red)