# Catalogue of SpaceTimes (COST)

This is the documentation for the Catalogue of SpaceTimes (COST) Julia package. It is a work in progress.

## About 

The aim of this documentation is to provide users with easy access to relevant information about a variety of spacetimes.

This documentation was produced using Gradus, a general-relativity ray-tracing software.
For more information, see the [Gradus website](https://astro-group-bristol.github.io/Gradus.jl/dev/).

## Individual SpaceTimes

- [Minkowski Metric](Minkowski.md)
- [Schwarzschild Metric](Schwarzschild.md)
- [Kerr Metric](Kerr.md)
- [Kerr-Newman Metric](Kerr-Newman.md)
- [Johannsen-Psaltis Metric](Johannsen-Psaltis.md)

## Metrics
In general relativity, the geometry of spacetime is encoded in the spacetime metric. The metric is a mathematical object which determines how distances and time intervals between events are measured in a given spacetime. It is determined by solving Einstein’s field equations, which relate the curvature of spacetime to the distribution of energy and momentum:

$$G^{\mu\nu} + \Lambda g^{\mu\nu} = 8\pi T^{\mu\nu}$$

These are sixteen equations that reduce to ten due to the symmetry of the tensors involved. $G^{\mu\nu}$ is the Einstein tensor, $\Lambda$ is the cosmological constant which is used to describe a vacuum energy field that adds to the expansion rate of the universe. $g^{\mu\nu}$ is the spacetime metric, and $T^{\mu\nu}$ is the stress-energy tensor which is equal to the flux of 4-momentum component $\mu$ in some direction $\nu$.


## The No-hair theorem

The No-hair theorem states that a neutral black hole can be fully defined by just its mass and its spin. Metrics that are solutions to Einstein's field equations obey this theorem. However, some metrics such as the Johannsen-Psaltis metric have been introduced with more parameters than the No-hair theorem allows for. These metrics are used to test the theorem and therefore general relativity itself.


## Units
In this catalogue we use $G=c=1$. This means that one gravitatinal radius $r_g = \dfrac{GM}{c^2} = M$.

The metrics that are shown are written in Boyer–Lindquist coordinates.
- ($t$) : time coordinate
- ($r$) : radial coordinate  
- ($\theta$) : polar angle  
- ($\phi$) : azimuthal angle

Spin is measured with the parameter $a=\dfrac{J}{Mc}=\dfrac{J}{M}$. Where $J$ is the total angular momentum of the black hole.

Energy is measured in relativistic units so that $E = \frac{total\ energy}{mc^2}$. $E=1$ is where the particle has energy equal to its rest mass energy.

## Christoffel symbols
Christoffel symbols are derived directly from the metric $g_{\mu\nu}$ and its derivatives $g_{\mu\nu,\alpha} = \dfrac{\partial g_{\mu\nu}}{\partial x^{\alpha}}$ using the equation:


$$\Gamma^{\alpha}_{\ \mu\nu} =
\frac{1}{2}\ g^{\alpha\beta}
\left(
g_{\beta\mu,\nu}
+
g_{\beta\nu,\mu}
-
g_{\mu\nu,\beta}
\right)$$

The Christoffel symbols describe how the basis vectors of the coordinate system vary from point to point. For example, in spherical coordinates the radial basis vector $e_r$ changes direction as the angular coordinate $\theta$ varies. In Cartesian coordinates the basis vectors are constant, and therefore all Christoffel symbols vanish. This can also be seen with the equation:

$$\Gamma^{\alpha}_{\ \mu\nu} = \left( \frac{\partial e_\mu}{\partial x^\nu} \right)^\alpha$$

## Riemann Tensors
A surface can have two types of curvature: intrinsic and extrinsic. Intrinsic curvature is curvature that can be measured entirely within the surface itself, without reference to a higher-dimensional space. One way to detect intrinsic curvature is by parallel transporting a vector around a closed loop: on an intrinsically curved surface, the vector will not return to its original orientation. A sphere is an example of a surface with intrinsic curvature.

Extrinsic curvature, on the other hand, depends on how a surface is embedded in a higher-dimensional space. A surface can appear curved from the outside but still have zero intrinsic curvature. In this case, a vector parallel transported around a closed loop returns to its original orientation. A cylinder is a good example: although it appears curved in three dimensions, it can be unrolled into a flat plane, so an ant walking on it would not detect any intrinsic curvature.

After a vector completes a closed loop on an intrinsically curved surface, the amount that it has changed direction is proportional to the value of the vector itself, the size of the loop in the $x^\mu$ direction, and the size of the loop in the $x^\nu$ direction.

$$\delta v^{\alpha} = -R^{\alpha}_{\ \beta \mu \nu} v^{\beta} \delta x^{\mu} \delta x^{\nu}$$

The constant of proportoinality is called the Riemann curvature tensor $R^{\alpha}_{\ \beta \mu \nu}$. Its components are calculated from the Christoffel symbols and their derivatives in the following way:


$$R^\alpha_{\ \beta\mu\nu}
=
\Gamma^\alpha_{\ \beta\nu , \mu}
-
\Gamma^\alpha_{\ \beta\mu , \nu}
+
\Gamma^\alpha_{\ \sigma\mu}\Gamma^\sigma_{\ \beta\nu}
-
\Gamma^\alpha_{\ \sigma\nu}\Gamma^\sigma_{\ \beta\mu}$$

## Ricci Tensors and Scalars
The Ricci tensor comes from a contraction of the Riemann tensor:

$$R^\alpha_{\ \mu\alpha\nu} = R_{\mu\nu}$$

By contracting this further, you arrive at the Ricci Scalar:

$$g^{\mu\nu}R_{\mu\nu} = R^{\mu}_{\ \mu} = R$$

Both of these are then used to define the Einstein tensor:

$$G^{\mu\nu} = R^{\mu\nu} - \frac{1}{2}g^{\mu\nu}R$$


## Orbits around a black hole

### Photon Orbit
There exists a radius around a black hole at which a photon can move on a circular null orbit. This is known as the photon orbit (or photon sphere in the spherically symmetric case), and it is highly unstable. Any small perturbation will cause the photon to either spiral into the event horizon or escape to infinity.

The radius of the photon orbit depends on the parameters of the black hole. For a non-rotating black hole there is a single photon sphere, whereas for a rotating black hole the photon orbit radius depends on the spin parameter (a) and on whether the photon is rotating with or against the black holes spin.

### ISCO
The ISCO (Innermost Stable Circular Orbit) is the smallest radius at which stable circular motion is possible around a black hole. It defines the inner edge of the accretion disk.

The effective potential for a particle orbiting a black hole has a minimum at radii where stable circular orbits occur and a maximum where unstable circular orbits occur. The minimum and maximum approach each other as you look at particle orbits with a smaller radius. The radius at which they merge corresponds to an inflection point of the effective potential. This radius defines the ISCO.

Inside the ISCO lies the plunging region, where matter can no longer maintain a stable circular orbit and rapidly spirals into the event horizon.

The ISCO radius also depends on the parameters of the black hole. For a rotating black hole, it varies with the spin parameter a, decreasing for prograde orbits and increasing for retrograde orbits. It can also change in modified or non-Kerr spacetimes.

### Marginally bound orbit
The marginally bound orbit is the radius at which a particle will perform an unstable circular orbit with just enough energy to escape to infinity if slightly perturbed outward, corresponding to $E=1$.

## Line Profiles
A line profile is a graph which shows how flux varies with energy or wavelength. In the case of black holes, line profiles are produced from the reflected x-rays of the accretion disk of the black hole. The most prominent feature in the spectrum is the iron kα line at 6.4 keV. As this line is intrinsically narrow, any broadening observed can be attributed to GR effects.

## COST.jl function documentation

```@meta
CurrentModule = COST
```

