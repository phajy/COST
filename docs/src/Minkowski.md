# Minkowski metric

The Minkowski metric describes the geometry of flat spacetime.

## Metric definition

The Minkowski metric in cartesian coordinates given by:

$$ds^2 = -dt^2 + dx^2 + dy^2 + dz^2$$

or in matrix form:


$$g_{\mu\nu} =
\begin{pmatrix}
- 1 & 0 & 0 & 0 \\

0 & 1 & 0 & 0 \\

0 & 0 & 1 & 0 \\

0 & 0 & 0 & 1 \\
\end{pmatrix}$$


And in polar coordinates: 

$$ds^2 = -dt^2 + dr^2 + r^2d\theta^2 + r^2sin^2{\theta}d\phi^2$$


$$g_{\mu\nu} =
\begin{pmatrix}
- 1 & 0 & 0 & 0 \\

0 & 1 & 0 & 0 \\

0 & 0 & r^2 & 0 \\

0 & 0 & 0 & r^2sin^2{\theta} \\
\end{pmatrix}$$


## Christoffel symbols


$$\begin{aligned}
\Gamma^{r}_{\theta\theta} & = -r, &
\Gamma^{r}_{\phi\phi} & = -r\sin^2\theta, &
\Gamma^{\theta}_{r\theta} & = \frac{1}{r}, \\[2mm]
\Gamma^{\theta}_{\phi\phi} & = -\sin\theta\cos\theta, &
\Gamma^{\phi}_{r\phi} & = \frac{1}{r}, &
\Gamma^{\phi}_{\theta\phi} & = \cot\theta
\end{aligned}$$



