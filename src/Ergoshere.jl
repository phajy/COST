using Plots

M = 1.0
a = 0.998

θ = range(0, 2π, length=1000)

# Event Horizon
r_plus = M + sqrt(M^2 - a^2)
x_e = r_erg .* sin.(θ)
y_e = r_erg .* cos.(θ)

# Ergosphere
r_erg = M .+ sqrt.(M^2 .- a^2 .* cos.(θ).^2)
x_h = r_plus .* sin.(θ)
y_h = r_plus .* cos.(θ)


plot(x_e, y_e,
    aspect_ratio=1,
    label="Ergosphere",
    linewidth=2)

plot!(x_h, y_h,
    label="Event Horizon",
    linewidth=2,
    linestyle=:dash)

scatter!([0], [0], color=:black, markersize=4, label="Singularity")

title!("Kerr Black Hole (M=$M, a=$a)")