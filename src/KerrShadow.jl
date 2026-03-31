using Gradus, Plots

m = KerrMetric(1.0, 0.998)
x = SVector(0.0, 10000.0, π / 2, 0.0)

α, β, img = rendergeodesics(
    m,
    x,
    20_000.0,
    image_width = 600,
    image_height = 600,
    αlims = (-6, 9),
    βlims = (-6, 6),
    verbose = true,
    ensemble = Gradus.EnsembleSerial(),
)

p = Plots.heatmap(
    α,
    β,
    img,
    color = Plots.cgrad(:thermal, rev = false),
    xlabel = "α (r_g)",
    ylabel = "β (r_g)",
    aspect_ratio = 1,
    minorgrid = true,
    right_margin = 10Plots.mm
)

Plots.contour!(p, α, β, img, color = :red)

p

 savefig("docs/src/figures/KerShadP.png")