using Gradus
using StaticArrays
using Plots

spins = [0.2, 0.4, 0.6, 0.8, 0.98]

d = ThinDisc(0.0, Inf)
x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)

plt = plot(
    xlabel = "g = E / E₀",
    ylabel = "Flux",
    lw = 2
)

for a in spins
    m = KerrMetric(M = 1.0, a = a)
    bins, flux = lineprofile(m, x, d)
    plot!(plt, bins, flux, label = "a = $a")
end

plt
