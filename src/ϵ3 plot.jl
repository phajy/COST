
using Gradus
using Makie, CairoMakie


# Create a range of ϵ3 values from -1 to 1 with 200 steps
ϵ3_values = range(-0.91, 0.91, length=200)

# Initialize an array to store the horizon radii
horizon_radii = zeros(length(ϵ3_values))
# Initialize an array to store the ISCO radii
isco_radii = zeros(length(ϵ3_values))
# Initialize an array to store the photon orbit radii
#photon_radii = zeros(length(ϵ3_values))

# Calculate the horizon radius for each value of ϵ3
for (i, ϵ3) in enumerate(ϵ3_values)
    # m = KerrMetric(M = 1.0, a = a)
    m = JohannsenPsaltisMetric(M = 1.0, a = 0.8, ϵ3 = ϵ3)
    rs, θs = event_horizon(m, resolution = 200)
    
    # Find the index closest to the equatorial plane (θ = π/2)
    closest_idx = argmin(abs.(θs .- π/2))
    
    # Extract the radius at that index
    horizon_radii[i] = rs[closest_idx]

    # Calculate the ISCO radius
    println("Metric: ", m)
    isco_radii[i] = Gradus.isco(m)

     #Calculate the photon orbit radius
    #photon_radii[i] = 2*(1+cos((2/3)*acos(-a)))
end

# Plot the horizon radius as a function of ϵ3
fig = Figure()
ax = Axis(fig[1, 1], xlabel="Deviation parameter (ϵ3)", ylabel="Horizon radius at θ=π/2")
lines!(ax, ϵ3_values, horizon_radii, color=:blue, label="Horizon radius")
lines!(ax, ϵ3_values, isco_radii, color=:red, label="ISCO radius")
#lines!(ax, ϵ3_values, photon_radii, color=:green, label="Photon orbit radius")
axislegend(ax)  # Add a legend using the labels
fig
