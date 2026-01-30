using Gradus 
using StaticArrays 
using Plots # Kerr black hole (G = c = M = 1 units) 
m = KerrMetric(M = 1.0, a = 0.998) 

# Infinitely thin equatorial disc

d = ThinDisc(0.0, Inf) 
# Observer position: # (t, r, θ, φ) 
x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)

bins, flux = lineprofile(m, x, d) 

plot( 
    bins, 
    flux, 
    xlabel = "g = E / E₀", 
    ylabel = "Flux", 
    legend = false, 
    lw = 2 
)