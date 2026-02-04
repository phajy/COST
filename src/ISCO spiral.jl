using Gradus

# define Schwarzschild spacetime

struct Schwarzschild{T} <: AbstractStaticAxisSymmetric{T}
    M::T
end

function Gradus.metric_components(m::Schwarzschild, x)
    r, θ = x
    M = m.M

    dt2 = -(1 - (2M / r))
    dr2 = -inv(dt2)
    dθ2 = r^2
    dϕ2 = r^2 * sin(θ)^2
    dtdϕ = zero(r)

    SVector(dt2, dr2, dθ2, dϕ2, dtdϕ)
end

Gradus.inner_radius(m::Schwarzschild) = 2 * m.M

m = Schwarzschild(1.0)
x1 = SVector(0.0, 6, π/2, 0.0)
v1 = SVector(0.0, 0.0, 0.0, 0.0963)

λ_max = 3200000000.0
sol = tracegeodesics(m, x1, v1, λ_max, μ=1.0)

x2 = SVector(0.0, 5.99, π/2, 0.0)
v2 = SVector(0.0, 0.0, 0.0, 0.0963)

sol2 = tracegeodesics(m, x2, v2, λ_max, μ=1.0)
using Plots

# plot solution trajectory
fig3 = plot_paths(sol, label = "Particle Trajectory along the ISCO", color = :red)
plot_paths!(sol2, label = "Perturbed Particle Trajectory", color = :blue)
plot_horizon!(m, label = "Event Horizon")