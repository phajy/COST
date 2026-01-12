using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    modules = [COST],
    pages = [
        "Home" => "index.md",
        "Kerr" => "kerr.md",
        "Schwarzschild" => "schwarzschild.md"
    ],
    format = Documenter.HTML(prettyurls = false)
)

