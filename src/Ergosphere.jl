using Gradus, Plots

M = 1.0
m = KerrMetric(M=M, a=1.0)

p = Plots.plot(
    aspect_ratio=1,
    legend=:topright,
    xlabel="x (r_g)",
    ylabel="y (r_g)"
)

θ = range(0, 2π, length=1000)

# Ergosphere radius
r_erg = M .+ sqrt.(M^2 .- m.a^2 .* cos.(θ).^2)

# Convert to Cartesian coordinates
x_erg = r_erg .* sin.(θ)
y_erg = r_erg .* cos.(θ)

# Plot Ergosphere
Plots.plot!(p, x_erg, y_erg,
    label="Ergosphere",
    lw=2,
    linestyle=:dash,
    color=:red
)

Plots.xlims!(-3, 3)
Plots.ylims!(-2, 2)

# Event horizon
plot_horizon!(m, lw=2, color=:black, label="Event Horizon")