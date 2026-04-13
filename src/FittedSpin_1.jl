using Plots

#duration of 10,0000
#input_spin      = [0, 0.35, 0.5, 0.75, 0.85, 0.9]
#fitted_spin  = [1E-02,0.372, 0.538, 0.773, 0.842, 0.994]
#error_low       = [NaN, 0.0193, 0.0389, 0.0132, 0.00234, 0.0028]
#error_high      = [0.08, 0.0193, 0.0058, 0.0034, 0.02286, NaN]  # NaN for missing upper error

#duration of 10,000
#input_spin      = [0, 0.35, 0.5, 0.75, 0.85, 0.9]
#fitted_spin  = [1.60920E-02,0.315973, 0.509117, 0.602346,  0.596378, 0.706655]
#error_low       = [0, 0.135667, 0.065933, 0.051099, 0.098541,0.088546]
#error_high      = [0.105997, 0.060933, 0.06801, 0.102205, 0.124092, 0.079162]  


#at 6.4KeV
input_spin  = [0, 0.3, 0.35, 0.5, 0.6, 0.75, 0.85]
fitted_spin = [0.0134666, 0.507796, 0.463186, 0.688159, 0.740372, 0.835193, 0.956129]
error_low   = [0, 0.004817, 0.002161, 0.000670, 0.003833, 0.000668, 0.004343]
error_high  = [0, 0.004816, 0.002161, 0.004341, 0.000581, 0.003368, 0.000955]

# error matrix
y_err = [error_low error_high]

scatter(input_spin, fitted_spin;
    yerr = y_err,
    xlabel = "True Spin",
    ylabel = "Fitted Spin",
    #title = "Fitted vs Real Spin at 6.4keV for duration: 100,000",
    color = :blue,
    markersize = 2,
    legend = false
)

#line obf
plot!([0, 1], [0, 1], linestyle = :dash, color = :red)


savefig("src/figures/SpinVsSpin.png")