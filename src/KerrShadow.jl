using Gradus, Plots

m = KerrMetric(1.0, 0.998)
x = SVector(0.0, 10000.0, π / 2, 0.0)

α, β, img = rendergeodesics(
    m,
    x,
    20_000.0,
    image_width = 100,
    image_height = 100,
    αlims = (-6, 9),
    βlims = (-6, 6),
    verbose = true,
    ensemble = Gradus.EnsembleSerial(),  
)

p = Plots.heatmap(
    α,
    β,
    img,
    color = Plots.cgrad(:thermal, rev = true),
    xlabel = "α",
    ylabel = "β",
    aspect_ratio = 1,
    minorgrid = true,
)

Plots.contour!(p, α, β, img, color = :red)
