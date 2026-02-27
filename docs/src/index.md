# Catalogue of SpaceTimes (COST)

This is the documentation for the Catalogue of SpaceTimes (COST) Julia package. It is a work in progress.

## About 

The aim of this documentation is to provide users with easy access to relevant information about a variety of spacetimes.

This documentation was produced using Gradus, a general-relativity ray-tracing software.
For more information, see the [Gradus website](https://astro-group-bristol.github.io/Gradus.jl/dev/).

## Individual SpaceTimes

- [Minkowski Metric](Minkowski.md)
- [Schwarzschild Metric](schwarzschild.md)
- [Kerr Metric](kerr.md)
- [Kerr-Newman Metric](Kerr-Newman.md)
- [Johannsen-Psaltis Metric](Johannsen-Psaltis.md)


## Units
In this catalogue we use $G=c=1$. This means that one gravitatinal radius $r_g = \dfrac{GM}{c^2} = M$.

The metrics that are shown are written in Boyer–Lindquist coordinates.
- ($t$) : time coordinate
- ($r$) : radial coordinate  
- ($\theta$) : polar angle  
- ($\phi$) : azimuthal angle

Spin is measured with the parameter $a=\dfrac{J}{Mc}=\dfrac{J}{M}$. Where $J$ is the total angular momentum of the black hole.

Energy is measured in relativistic units so that $E = \frac{total energy}{mc^2}$. $E=1$ is where the particle has energy equal to its rest mass energy.

## Metrics
A metric is a mathematical object which determines how distances and time intervals between events are measured in a given spacetime.

## Christoffel symbols
Christoffel symbols are derived directly from the metric $g_{\mu\nu}$ and its derivatives $g_{\mu\nu,\alpha} = \dfrac{\partial g_{\mu\nu}}{\partial x^{\alpha}}$ using the equation:


$$\Gamma^{\alpha}_{\mu\nu} =
\frac{1}{2}\ g^{\alpha\beta}
\left(
g_{\beta\mu,\nu}
+
g_{\beta\nu,\mu}
-
g_{\mu\nu,\beta}
\right)$$

The Christoffel symbols take into account how the basis vectors of the coordinate system change with respect to one another. For example, $e_r$ will change in direction as $\theta$ changes. Christoffel symbols are zero in Cartesian coordinates because $e_x$ will not change with $y$ or $z$ or vice versa.

This can also be seen with the equation:


$$\Gamma^{\alpha}_{\mu\nu} = \left( \frac{\partial e_\mu}{\partial x^\nu} \right)^\alpha$$


## Orbits around a black hole

### Photon Orbit
There exists a radius around a black hole at which a photon can form
a closed orbit, known as a photon orbit. This orbit is very unstable. Any slight
perturbation causes the photon to either spiral into the event horizon or
escape to infinity. Every type of black hole has a different photon orbit radius as it depends on parameters such as spin (a).

### ISCO
The ISCO is the inner-most stable circular orbit. It defines the inner edge of the
accretion disk and arises because infalling matter converts potential energy to
kinetic energy. The matter eventually reaches relativistic speeds which cause
the orbit to become unstable. The area inside the ISCO is called the plunging region as any matter inside will spiral into the event horizon. The ISCO also varies with spin and other parameters of the black hole.

### Marginally bound orbit
The marginally bound orbit is the radius at which a particle will perform an unstable circular orbit with just enough energy to escape to infinity if slightly perturbed outward, corresponding to $E=1$.

## Line Profiles
A line profile is graph which shows how flux varies with energy or wavelength. In the case of black holes, line profiles are produced from the reflected x-rays of the acreation disk of the black hole. The most prominent feature in the spectrum is the iron kα line at 6.4 keV. As this line is intrinsically narrow, any broadening observed can be attributed to GR effects.

## COST.jl function documentation

```@meta
CurrentModule = COST
```

