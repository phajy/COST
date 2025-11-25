# Schwarzschild metric

## Metric definition

## Special radii

## Particle orbits

Outside the Innermost Stable Circular Orbit (ISCO) particles can follow circular orbits.

```julia
using Gradus, Plots

m = KerrMetric(M=1.0, a=0.0)

p = plot(aspect_ratio=1)

for r in [6.0, 7.0]
    v = CircularOrbits.fourvelocity(m, r)
    # trace the circular orbit
    path = tracegeodesics(m, @SVector([0.0, r, π/2, 0.0]), v, (0.0, 300.0), μ = 1.0)
    plot_paths!(p, path, extent = 10, legend = false)
end

savefig(p, "docs/src/figures/schwarzschild_circular_orbits.svg")
```

![Schwarzschild circular orbits](figures/schwarzschild_circular_orbits.svg)
