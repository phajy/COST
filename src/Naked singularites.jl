using Gradus, Plots

function draw_horizon(p, m)
    rs, θs = event_horizon(m, resolution = 200)
    radius = rs

    x = @. radius * sin(θs)
    y = @. radius * cos(θs)
    plot!(p, x, y, label = "a = $(m.a)")
end

p = plot(aspect_ratio = 1)
for a in [0.0, 0.5, 0.6, 0.7, 0.8, 0.9]
    m = JohannsenPsaltisMetric(M = 1.0, a = a, ϵ3 = 2.0)
    draw_horizon(p, m)
end
p