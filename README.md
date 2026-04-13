# Catalogue of Space-times project


## Overview

This project is a computational catalogue of relativistic spacetimes implemented in Julia. It explores and visualises key solutions, as well as one deviation from General Relativity, including:

- Minkowski spacetime  
- Schwarzschild spacetime  
- Kerr spacetime  
- Kerr–Newman spacetime  
- Johannsen–Psaltis spacetime  

The project uses numerical simulations, analytical tools, and visualisations, with documentation generated using Julia's Documenter.jl.

---

## Project Structure

- `src/`  
  Julia source code for spacetime metrics and figure generation  

- `docs/`  
  Documentation source and generated website  
  - `docs/build/` contains the final HTML catalogue  

- Top-level data files  
  Data used in simulations (e.g. FITS tables and response matrices such as `DiscLineTable.fits` and the `xmm-response/` folder)

- `Project.toml` / `Manifest.toml`  
  Define the Julia environment and dependencies  

---

## Viewing the Catalogue

To view the full spacetime catalogue, open:

docs/build/index.html

Open this file in a web browser. It provides a structured and navigable overview of all implemented spacetimes and associated figures.

---

## Running the Code

1. Open Julia in the project directory  

2. Activate the environment:
```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()
```


Run individual scripts from the src/ directory as needed, for example:

```julia
include("src/Schwarzschild_orbits.jl")
```