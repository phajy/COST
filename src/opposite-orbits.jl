using Gradus, Plots

#Prograde and retrograde photon orbits


# Kerr black hole
m = KerrMetric(M=1.0, a=0.8)
λ_max = 2000

# Radii
r_pro   = 1.81109
r_retro = 3.81877   #radii that give circular orbits

# Circular geodesic velocities
v_pro = CircularOrbits.fourvelocity(m, r_pro; contra_rotating=false)
v_retro = CircularOrbits.fourvelocity(m, r_retro; contra_rotating=true)

# Initial positions
x_pro    = @SVector [0.0, r_pro, π/2, 0.0]
x_retro = @SVector [0.0, r_retro, π/2, 0.0]

# Trace geodesics
sol_pro = tracegeodesics(m, x_pro, v_pro, λ_max, μ=0.0)   #μ=0.0 is null geodesic (photon)
sol_retro = tracegeodesics(m, x_retro, v_retro, λ_max, μ=0.0)
# Plotting
p = plot(aspect_ratio=1)

plot_paths!(p, sol_retro, label="Retrograde", color=:orange, n_points = 100000)
plot_paths!(p, sol_pro, label="Prograde", color=:blue, n_points = 100000)
plot_horizon!(m, lw=2, color=:black, label="Event Horizon")

xlims!(-10, 10)
ylims!(-10, 10)


xlabel!("x")
ylabel!("y")


