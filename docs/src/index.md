# Catalogue of SpaceTimes (COST)

This is the documentation for the Catalogue of SpaceTimes (COST) Julia package. It is a work in progress.

## Individual SpaceTimes

- [Minkowski Metric](Minkowski.md)
- [Schwarzschild Metric](schwarzschild.md)
- [Kerr Metric](kerr.md)
- [Kerr-Newman Metric](Kerr-Newman.md)
- [Johannsen-Psaltis Metric](Johannsen-Psaltis.md)


## Units
In this catalogue we use $G=c=1$. This means that one gravitatinal radius $r_g = \dfrac{GM}{c^2} = M$. Spin is measured with the parameter $a=\dfrac{J}{Mc}=\dfrac{J}{M}$.

## Orbits around a black hole

### Photon Orbit
There exists a radius around a black hole at which a photon can form
a closed orbit. This is called the photon orbit and it is very unstable. Any slight
perturbation would cause the photon to either spiral into the event horizon or
escape to infinity. We will see that every type of black hole has a different photon orbit radius as it depends on parameters such as spin (a).

### ISCO
The ISCO is the inner-most stable circular orbit. It defines the inner edge of the
accretion disk and arises because infalling matter converts potential energy to
kinetic energy. The matter eventually reaches relativistic speeds which cause
the orbit to become unstable. The area inside the ISCO is called the plunging region as any matter inside will spiral into the event horizon. The ISCO also varies with spin and other parameters of the black hole.

### Marginally bound orbit




## COST.jl function documentation

```@meta
CurrentModule = COST
```

