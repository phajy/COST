using Gradus
using StaticArrays
using Plots

inclination = [50.0, 55.0, 60.0, 65.0, 70.0]
m = KerrMetric(M = 1.0, a = 0.8)

d = ThinDisc(0.0, Inf)


plt = Plots.plot(
    xlabel = "E / E₀",
    ylabel = "Flux (a.u.)",
    lw = 2
)

for inc in inclination
    x = SVector(0.0, 10_000.0, deg2rad(inc), 0.0)
    bins, flux = lineprofile(m, x, d)
    Plots.plot!(plt, bins, flux, label = "i° = $inc")
end

plt

savefig("docs/src/figures/LineKerrIncl.png")