using Gradus
using Makie, CairoMakie


# Create a range of a values from -1 to 1 with 200 steps
a_values = range(-1.0, 1.0, length=200)

# Initialize an array to store the horizon radii
horizon_radii = zeros(length(a_values))
# Initialize an array to store the ISCO radii
isco_radii = zeros(length(a_values))
# Initialize an array to store the photon orbit radii
photon_radii = zeros(length(a_values))

# Calculate the horizon radius for each value of a
for (i, a) in enumerate(a_values)
    m = KerrMetric(M = 1.0, a = a)
    rs, θs = event_horizon(m, resolution = 200)
    
    # Find the index closest to the equatorial plane (θ = π/2)
    closest_idx = argmin(abs.(θs .- π/2))
    
    # Extract the radius at that index
    horizon_radii[i] = rs[closest_idx]

    # Calculate the ISCO radius
    println("Metric: ", m)
    isco_radii[i] = Gradus.isco(m)

     #Calculate the photon orbit radius for a Kerr black hole
    photon_radii[i] = 2*(1+cos((2/3)*acos(-a)))
end

# Plot the radii as a function of a
fig = Figure()
ax = Axis(fig[1, 1], xlabel="Spin parameter (a)", ylabel="Radii at θ=π/2")
lines!(ax, a_values, horizon_radii, color=:black, label="Horizon radius")
lines!(ax, a_values, isco_radii, color=:red, label="ISCO radius")
lines!(ax, a_values, photon_radii, color=:blue, label="Photon orbit radius")
axislegend(ax)  # Add a legend using the labels
fig
