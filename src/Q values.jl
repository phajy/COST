using Gradus
using CairoMakie

M = 1.0
a = 0.8
qmax = sqrt(1 - a^2)
Q_values = range(-qmax, qmax, length=200)

horizon_radii = zeros(length(Q_values))
isco_radii = fill(NaN, length(Q_values))

for (i, q) in enumerate(Q_values)
    m = KerrNewmanMetric(M = M, a = a, Q = q)

    rs, θs = event_horizon(m, resolution = 200)
    closest_idx = argmin(abs.(θs .- π/2))
    horizon_radii[i] = rs[closest_idx]

    try
        isco_radii[i] = Gradus.isco(m)
    catch
        isco_radii[i] = NaN
    end
end

# Only after loop completes:

fig = Figure()
ax = Axis(fig[1, 1], xlabel="Charge (Q)", ylabel="Radii at θ=π/2")

lines!(ax, Q_values, horizon_radii, color=:black, label="Horizon radius")
lines!(ax, Q_values, isco_radii, color=:red, label="ISCO radius")

axislegend(ax)
display(fig)