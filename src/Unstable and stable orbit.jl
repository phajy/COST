using Gradus, Plots

#Stable and Perturbed Stable orbits

# Schwarzschild black hole
m = KerrMetric(M=1.0, a=0.0)
λ_max = 2000

# Radii
r_stable = 7.0
r_stable2 = 6.99
r_ISCO   = 6.0
r_unstable = 5.99

# Circular geodesic velocities
v_stable   = CircularOrbits.fourvelocity(m, r_stable)
v_stable2  = v_stable
v_ISCO     = CircularOrbits.fourvelocity(m, r_ISCO)
v_unstable = v_ISCO

# Initial positions
x_stable   = @SVector [0.0, r_stable, π/2, 0.0]
x_stable2  = @SVector [0.0, r_stable2, π/2, 0.0]
x_ISCO     = @SVector [0.0, r_ISCO, π/2, 0.0]
x_unstable = @SVector [0.0, r_unstable, π/2, 0.0]

# Trace geodesics
sol_stable   = tracegeodesics(m, x_stable, v_stable, λ_max, μ=1.0)
sol_stable2  = tracegeodesics(m, x_stable2, v_stable2, λ_max, μ=1.0)
sol_ISCO     = tracegeodesics(m, x_ISCO, v_ISCO, λ_max, μ=1.0)
sol_unstable = tracegeodesics(m, x_unstable, v_unstable, λ_max, μ=1.0)

# Plotting
p = plot(aspect_ratio=1)

plot_paths!(p, sol_stable,   label="Stable (r=7M)", color=:blue)
plot_paths!(p, sol_stable2,  label="Stable (r=6.99M)", color=:green)
plot_paths!(p, sol_ISCO,     label="ISCO (r=6M)", color=:red)
plot_paths!(p, sol_unstable, label="Unstable (r=5.99M)", color=:orange)
plot_horizon!(m, lw=2, color=:black, label="Event Horizon")

xlabel!("x")
ylabel!("y")
title!("Orbits and perturbations")

xlims!(-10, 10)
ylims!(-10, 10)

plot!(p, legend=:outertopright)

