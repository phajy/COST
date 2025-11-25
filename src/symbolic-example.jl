using Gradus
using Symbolics
using Latexify

# Define Schwarzschild metric
m = KerrMetric(M=1.0, a=0.0)

# Define Kerr metric where M and a are symbolic variables
# @variables M a
# m = KerrMetric(M, a)

# We want to evaluate the metric components at symbolic coordinates
@variables t r θ ϕ
x = [t, r, θ, ϕ]

# Print the metric components in LaTeX format
mc = metric_components(m, x)
latexify(mc)
