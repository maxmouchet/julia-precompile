using Glob
using Pkg
using PackageCompiler

project = Pkg.TOML.parsefile("Project.toml")
packages = Symbol.(keys(project["deps"]))
@show packages

# TODO: Remove old statements
statements = glob("statements/*.jl")

create_sysimage(
    packages,
    project = @__DIR__,
    replace_default = true,
    precompile_statements_file = statements,
)
