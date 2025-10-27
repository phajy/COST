using Gradus, Plots

n = 10
a_vals = range(-0.998, 0.998, length=n)

anim = @animate for a ∈ a_vals

    # metric and metric parameters
    m = KerrMetric(M=1.0, a=a)
    # observer position
    x = SVector(0.0, 1000.0, deg2rad(70), 0.0)
    # accretion disc
    d = ThinDisc(Gradus.isco(m), 30.0)

    pf = ConstPointFunctions.redshift(m, x) ∘ ConstPointFunctions.filter_intersected()

    α, β, img = rendergeodesics(
        m,
        x,
        d,
        # maximum integration time
        2000.0,
        αlims = (-40, 40),
        βlims = (-20, 25),
        image_width = 800,
        image_height = 400,
        verbose = true,
        pf = pf,
    )
    
    heatmap(α, β, img, aspect_ratio = 1, clims = (0, 1.4))
end
gif(anim, "disc_image.gif", fps = 10)
