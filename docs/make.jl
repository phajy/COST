using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    pages = [
        "Home" => "index.md",
        "Schwarzschild" => "schwarzschild.md",
        "Kerr" => "kerr.md"
    ],
    format = Documenter.HTML(prettyurls = false)
)

deploydocs(
    repo = "github.com/phajy/COST.git",
    devbranch = "main"
)
