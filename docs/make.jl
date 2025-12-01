using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    modules = [COST],
    format = Documenter.HTML()
)

deploydocs(
    repo = "github.com/phajy/COST.git",
    devbranch = "main"
)
