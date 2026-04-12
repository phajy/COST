using CairoMakie

# Time range
t = range(0, 10, length=200)

# Different velocities where |v| < 1
velocities = [-0.8, -0.4, 0.0, 0.4, 0.8]

fig = Figure()
ax = Axis(fig[1, 1],
    xlabel = "x",
    ylabel = "t",
)

for v in velocities
    x = v .* t  # straight line
    lines!(ax, x, t, label = "v = $(v)")
end

# Plot light rays (x = ±t)
lines!(ax, t, t, linestyle = :dash, color = :black, label = "light ray")
lines!(ax, -t, t, linestyle = :dash, color = :black)

axislegend(ax, position = :rb)

fig