using Gradus, Plots

#Overlapping prograde and retrograde photon orbits around a Schwarzschild black hole


# Kerr black hole
m = KerrMetric(M=1.0, a=0.0)
λ_max = 2000

# Radii
r_pro   = 3.0
r_retro = 3.0

# Circular geodesic velocities
v_pro = @SVector [0.0, 0.0, 0.0, 1.1] #four velocities for circular orbits
v_retro = @SVector [0.0, 0.0, 0.0, -1.1]

# Initial positions
x_pro    = @SVector [0.0, r_pro, π/2, 0.0]    #starting at the same position
x_retro = @SVector [0.0, r_retro, π/2, 0.0]

# Trace geodesics
sol_pro = tracegeodesics(m, x_pro, v_pro, λ_max, μ=0.0)   #μ=0.0 is null geodesic (photon)
sol_retro = tracegeodesics(m, x_retro, v_retro, λ_max, μ=0.0)
# Plotting
p = plot(aspect_ratio=1)

plot_paths!(p, sol_retro, label="Clockwise orbit", color=:orange, n_points = 100000)
plot_paths!(p, sol_pro, label="Anti-clockwise orbit", color=:blue, n_points = 100000)
plot_horizon!(m, lw=2, color=:black, label="Event Horizon")

xlims!(-10, 10)
ylims!(-10, 10)


xlabel!("x")
ylabel!("y")