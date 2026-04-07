using Gradus
using StaticArrays
using Plots

spins = [-0.9, -0.5, 0.0, 0.5, 0.9]
d = ThinDisc(0.0, Inf)
x = SVector(0.0, 10_000.0, deg2rad(30.0), 0.0)

plt = Plots.plot(
    xlabel = "E / E₀",
    ylabel = "Flux",
    lw = 2
)

for a in spins
    m = KerrMetric(M = 1.0, a = a)
    bins, flux = lineprofile(m, x, d)
    Plots.plot!(plt, bins, flux, label = "a = $a")
end

plt
