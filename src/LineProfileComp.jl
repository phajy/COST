using Gradus
using StaticArrays
using Plots
using Interpolations, Statistics


a1 =  0.374598 
a2 = 0.3
ϵ3 = -0.25

m1 = KerrMetric(M = 1.0, a = a1) #defines the spacetime
m2 = JohannsenPsaltisMetric(M = 1.0, a = a2, ϵ3 = ϵ3 )
#is_naked_singularity(m2)

d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)

bins1, flux1 = lineprofile(m1, x, d)

bins2, flux2  = lineprofile(m2, x, d)

#bins2, flux2  = lineprofile(m2, x, d; )#method = BinningMethod())

Plots.plot(
    bins1,
    flux1,
    xlabel = "E / E₀",
    ylabel = "Flux (a.u.)",
    legend = true,
    lw = 2,
    label = "a = $a1 (Kerr)"
)

Plots.plot!(
    bins2,
    flux2,
    xlabel = "E / E₀",
    ylabel = "Flux (a.u.)",
    legend = true,
    lw = 2,
    label = "a = $a2 & ϵ3 = $ϵ3 (Johannsen-Psaltis)"
)

savefig("docs/src/figures/a0.3e-0.25.png")

#Evaluates the interpolation function at the Kerr energy bins (bins1).
interp = LinearInterpolation(bins2, flux2, extrapolation_bc=Line())


#flux2_interp now contains the JP flux sampled at the same energies as the Kerr spectrum.
flux2_interp = interp.(bins1)

#Normalises the flux so their shapes can be compared
flux1_norm = flux1 ./ sum(flux1)
flux2_norm = flux2_interp ./ sum(flux2_interp)

#Calculates the root mean square difference between Kerr and JP
rmse = sqrt(mean((flux1_norm .- flux2_norm).^2))
println("RMSE = ", rmse)#If RMSE = 0, they're almost identical

#Correlation coefficient measures how similar their shapes are 
corr = cor(flux1_norm, flux2_norm)
println("Correlation = ", corr)# corr = 1 then identical. corr = 0 no correltation

#find their ratio
ratio = flux2_norm ./ flux1_norm

plot(
    bins1,
    ratio,
    xlabel = "E/E₀",
    ylabel = "JP/Kerr",
    label = "Ratio",
    xlims = (0.45, maximum(bins1)),  # keep your x-axis limits
    ylims = (0, 2),                  # set y-axis from -1 to 1
    legend = false,
)

hline!([1], linestyle = :dash, label = "")