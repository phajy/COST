using Gradus
using StaticArrays
using Plots

m = KerrMetric(M = 1.0, a = 0.998)

d = ThinDisc(0.0, Inf)

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)

bins, flux = lineprofile(m, x, d)

plot(
    bins,
    flux,
    xlabel = "g = E / E₀",
    ylabel = "Flux",
    legend = false,
    lw = 2
)
