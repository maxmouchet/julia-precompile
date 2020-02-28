using Pkg

Pkg.activate(".")
Pkg.instantiate()
Pkg.precompile()

for (name, version) in Pkg.installed()
    println("Running tests for $name $version")
    try
        Pkg.test(name, julia_args=["--compile=all", "--trace-compile=statements/$(name)-$(version).jl"])
    catch e
        @warn e
    end
end
