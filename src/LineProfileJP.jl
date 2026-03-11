using Gradus
using StaticArrays
using Plots

eps3 = [-2.0,0,2.0]

d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)


plt = Plots.plot(
    xlabel = "E / E₀",
    ylabel = "Flux",
    lw = 2
)

for ϵ3 in eps3
    m = JohannsenPsaltisMetric(M = 1.0, a = 0.2, ϵ3 = ϵ3 )
    bins, flux = lineprofile(m, x, d)
    Plots.plot!(plt, bins, flux, label = "ϵ3 = $ϵ3")
end

plt


