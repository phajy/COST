using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    pages = [
        "Home" => "index.md",
        "Minkowski" => "Minkowski.md",
        "Schwarzschild" => "schwarzschild.md",
        "Kerr" => "kerr.md",
        "Johannsen-Psaltis" => "Johannsen-Psaltis.md",
        "Kerr-Newman" => "Kerr-Newman.md"
        ],
    format = Documenter.HTML(prettyurls = false)
)

deploydocs(
    repo = "github.com/phajy/COST.git",
    devbranch = "main"
)
    