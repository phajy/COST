using Documenter
using COST

makedocs(
    sitename = "COST Documentation",
    modules = [COST],
    format = Documenter.HTML()
)

