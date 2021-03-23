using util
using Documenter

DocMeta.setdocmeta!(util, :DocTestSetup, :(using util); recursive=true)

makedocs(;
    modules=[util],
    authors="Custards1 <swagyolamos@gmail.com> and contributors",
    repo="https://github.com/Custards1/util.jl/blob/{commit}{path}#{line}",
    sitename="util.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Custards1.github.io/util.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Custards1/util.jl",
)
