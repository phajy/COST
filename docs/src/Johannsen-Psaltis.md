# Johannsen–Psaltis metric

The Johannsen–Psaltis metric is a Kerr-like parametric deviation designed to test the no-hair
theorem in the strong-field regime close to a black hole. It has three parameters: mass M, spin a, and deviation $\epsilon_{3}$.

## Metric definition

The Johannsen–Psaltis metric is given by

$$ds^2 = 
- \left(1 - \dfrac{r_s r}{\Sigma}\right)(1+h)\, dt^2

- \dfrac{2 r_s a r \sin^2\theta}{\Sigma} (1+h)\, dt\, d\phi + \dfrac{\Sigma (1+h)}{\Delta + a^2 h \sin^2\theta}\, dr^2

+ \Sigma\, d\theta^2 \\[3mm]

+ \left(r^2 + a^2 + \dfrac{r_s a^2 r \sin^2\theta}{\Sigma}


+ \dfrac{a^2 (\Sigma + r_s r) \sin^2\theta}{\Sigma} h \right) \sin^2\theta\, d\phi^2$$

or in matrix form:


$$g_{\mu\nu} =
\begin{pmatrix}
-(1+h)\left(1-\dfrac{r_s r}{\Sigma}\right) & 0 & 0 & -(1+h)\dfrac{a r_s r \sin^2\theta}{\Sigma} \\
0 & \dfrac{\Sigma(1+h)}{\Delta + a^2 h \sin^2\theta} & 0 & 0 \\
0 & 0 & \Sigma & 0 \\
-(1+h)\dfrac{a r_s r \sin^2\theta}{\Sigma} & 0 & 0 &
\sin^2\theta \left[r^2+a^2+\dfrac{a^2 r_s r \sin^2\theta}{\Sigma}
+h\dfrac{a^2(\Sigma+r_s r)\sin^2\theta}{\Sigma}\right]
\end{pmatrix}$$




where

$$\Sigma = r^{2} + a^{2} \cos^{2}\theta, \quad
\Delta = r^{2} - r_{s} r + a^{2}, \quad
r_{s} = 2 M, \quad
h = \epsilon_3 \dfrac{(r_s/2)^3 r}{\Sigma^2}$$

 
- ($a$) : spin parameter $(0 \le a \le M)$
- ($\epsilon_{3}$) : deviation parameter





























## Naked Singularities
Certain combinations of spin $(a)$ and the deviatoin parameter $(\epsilon_{3})$ can lead to the black hole having no event horizon at certain angles. This would lead to the singularity being exposed which is called a naked singularity.

The plot below shows the event horizon in the equatorial plane for different values of spin for $\epsilon_{3} = 2$. The parts of the event horizon that have no solution is where a naked singularity would be present.


```@raw html
<details>
<summary>Click to expand / collapse code block.</summary>
```

```julia
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
```
```@raw html
</details>
```

![Naked Singularities](figures/Naked_Singularities.png)


It can be seen from the plot below which combinations of $a$ and $\epsilon_3$ will produce a naked singularity.



















## Line Profile

```@raw html
<details>
<summary>Click to expand / collapse code block.</summary>
```

```julia
using Gradus
using StaticArrays
using Plots

m = JohannsenPsaltisMetric(M = 1.0, a = 0.8, ϵ3 = 0.5) #defines the spacetime

d = ThinDisc(0.0, Inf) #defines the accretion disk. Gradus will start with the emission at the ISCO and extends to infinity

x = SVector(0.0, 10_000.0, deg2rad(60.0), 0.0)#defines the observers position in spacetime (t, r, θ, ϕ)

bins, flux = lineprofile(m, x, d)

fig4 = plot(
    bins,
    flux,
    xlabel = "g = E / E₀",
    ylabel = "Flux",
    legend = false,
    lw = 2
)
```
```@raw html
</details>
```

![Johannsen-Psaltis Line Profile](figures/johannsen_line_prof.png)

















































