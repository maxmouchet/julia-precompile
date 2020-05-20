using Pkg

Pkg.activate(".")
Pkg.instantiate()

for (name, version) in Pkg.installed()
    output = "statements/$(name)-$(version).jl"
    if isfile(output)
        println("$output aready exists, skipping")
        continue
    end

    println("Running tests for $name $version")
    try
        Pkg.test(name, julia_args = ["--compile=all", "--trace-compile=$output"])
    catch e
        @warn e
    end
end
