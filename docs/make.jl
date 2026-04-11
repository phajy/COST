using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    pages = [
        "Home" => "index.md",
        "Minkowski" => "Minkowski.md",
        "Schwarzschild" => "schwarzschild.md",
        "Kerr" => "kerr.md",
        "Kerr-Newman" => "Kerr-Newman.md",
        "Johannsen-Psaltis" => "Johannsen-Psaltis.md"
        ],
    format = Documenter.HTML(prettyurls = false)
)

deploydocs(
    repo = "github.com/phajy/COST.git",
    devbranch = "main"
)
    