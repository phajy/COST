using Gradus
using StaticArrays
using Plots
using Interpolations, Statistics


a1 = 0.3
a2 = 0.374598


m1 = KerrMetric(M = 1.0, a = a1) #defines the spacetime
m2 = KerrMetric(M = 1.0, a = a2)
d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)

bins1, flux1 = lineprofile(m1, x, d)
bins2, flux2  = lineprofile(m2, x, d)
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
    label = "a = $a2  "
)


interp = LinearInterpolation(bins2, flux2, extrapolation_bc=Line())
flux2_interp = interp.(bins1)

flux1_norm = flux1 ./ sum(flux1)
flux2_norm = flux2_interp ./ sum(flux2_interp)

rmse = sqrt(mean((flux1_norm .- flux2_norm).^2))
println("RMSE = ", rmse)

corr = cor(flux1_norm, flux2_norm)
println("Correlation = ", corr)

ratio = flux2_norm ./ flux1_norm
residual = (flux2_norm .- flux1_norm) ./ flux1_norm

#plot(bins1, ratio, xlabel="E/E₀", ylabel="JP/Kerr", label="Ratio")
plot(
    bins1,
    ratio,
    xlabel = "E/E₀",
    ylabel = "JP/Kerr",
    label = "Ratio",
    xlims = (0.45, maximum(bins1)),  # keep your x-axis limits
    ylims = (0, 2)                   # set y-axis from -1 to 1
)

hline!([1], linestyle = :dash, label = "")
hline!([1], linestyle = :dash, label = "")
hline!([1], linestyle=:dash)