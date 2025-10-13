# Gradus examples

using Gradus
using Makie, CairoMakie

############################################################
# Plot of horizon radius as a function of spin parameter a #
############################################################

# Create a range of a values from -1 to 1 with 100 steps
a_values = range(-1, 1, length=200)

# Initialize an array to store the horizon radii
horizon_radii = zeros(length(a_values))
# Initialize an array to store the ISCO radii
isco_radii = zeros(length(a_values))

# Calculate the horizon radius for each value of a
for (i, a) in enumerate(a_values)
    m = KerrMetric(M = 1.0, a = a)
    rs, θs = event_horizon(m, resolution = 200)
    
    # Find the index closest to the equatorial plane (θ = π/2)
    closest_idx = argmin(abs.(θs .- π/2))
    
    # Extract the radius at that index
    horizon_radii[i] = rs[closest_idx]

    # Calculate the ISCO radius
    isco_radii[i] = Gradus.isco(m)
end

# Plot the horizon radius as a function of a
fig = Figure()
ax = Axis(fig[1, 1], xlabel="Spin parameter (a)", ylabel="Horizon radius at θ=π/2")
lines!(ax, a_values, horizon_radii, color=:blue, label="Horizon radius")
lines!(ax, a_values, isco_radii, color=:red, label="ISCO radius")
axislegend(ax)  # Add a legend using the labels
fig
