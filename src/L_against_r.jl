using Plots

M = 1.0

# Radius array (r > 3M to avoid divergence)
r = range(3.1*M, 20M, length=500)

# Angular momentum for circular orbits
L = sqrt.(M * r.^2 ./ (r .- 3*M))

# Plot L vs r
plot(r, L, xlabel="r", ylabel="L", label ="Angular Momentum for Circular Orbit", lw=2, color=:blue, legendfontsize=12)

# Add vertical dotted line for ISCO at r = 6M
vline!([6M], linestyle=:dot, lw=2, color=:red, label="ISCO (r = 6M)")