using Gradus
using Plots

function calc_exclusion(as, ϵs)
    regions = zeros(Float64, (length(as), length(ϵs)))
    Threads.@threads for i in eachindex(as)
        a = as[i]
        for (j, ϵ) in enumerate(ϵs)
            m = JohannsenPsaltisMetric(M = 1.0, a = a, ϵ3 = ϵ)
            regions[i, j] = if is_naked_singularity(m)
                NaN
            else
                Gradus.isco(m)
            end
        end
    end
    regions
end

as = range(0, 1.0, 100)
ϵs = range(-3, 3, 100)

img = calc_exclusion(as, ϵs)
heatmap(
    as,
    ϵs,
    img',
    colorbar = false,
    xlabel = "a",
    ylabel = "ϵ"
)