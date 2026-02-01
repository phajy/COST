using Gradus
using StaticArrays
using Plots

m = KerrMetric(M = 1.0, a = 0.998) #defines the spacetime

d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)

bins, flux = lineprofile(m, x, d)

fig4 = plot(
    bins,
    flux,
    xlabel = "g = E / E₀",
    ylabel = "Flux",
    legend = false,
    lw = 2
)

