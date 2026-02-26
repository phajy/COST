using Gradus, Plots

m = KerrMetric(M=1.0, a=0.0)

p = plot(aspect_ratio=1)

λ_max = 20000

# Radii
r_photon = 3
r_isco = 6

# Initial positions
x_photon = @SVector [0.0, r_photon, π/2, 0.0]
x_isco = @SVector [0.0, r_isco, π/2, 0.0]

# Circular geodesic velocities
v_photon = CircularOrbits.fourvelocity(m, r_photon)
v_isco = CircularOrbits.fourvelocity(m, r_isco)

path_ph = tracegeodesics(m, x_photon, v_photon, λ_max, μ = 0.0)
path_isco = tracegeodesics(m, x_isco, v_isco, λ_max, μ = 1.0)

# Plot
plot_paths!(p, path_ph, extent = 10, label="Photon Orbit")
plot_paths!(p, path_isco, extent = 10, label="ISCO")

plot_horizon!(m, lw=2, color=:black, label="Event Horizon")

p