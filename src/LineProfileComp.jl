using Gradus
using StaticArrays
using Plots

a1 = 0.998 
a2 = 0.8
ϵ3 = 0.5

m1 = KerrMetric(M = 1.0, a = a1) #defines the spacetime
m2 = JohannsenPsaltisMetric(M = 1.0, a = a2, ϵ3 = ϵ3 )

d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)

bins1, flux1 = lineprofile(m1, x, d)
bins2, flux2 = lineprofile(m2, x, d)
Plots.plot(
    bins1,
    flux1,
    xlabel = "E / E₀",
    ylabel = "Flux",
    legend = true,
    lw = 2,
    label = "a = $a1 (Kerr)"
)

Plots.plot!(
    bins2,
    flux2,
    xlabel = "E / E₀",
    ylabel = "Flux",
    legend = true,
    lw = 2,
    label = "a = $a2 & ϵ3 = $ϵ3 (Johannsen-Psaltis)"
)
