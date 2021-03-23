module util

# Write your package code here.
struct Cleaner 
pattern::Regex
exclude::Union{Array{Regex,1},Missing}
dir::String
clean_symlinks::bool
force::bool
Cleaner(pattern,exclude=missing,dir=pwd(),clean_symlinks=false,force=true) = new(pattern,exclude,dir,clean_symlinks,force)
end

function (c::Cleaner)()
    dir = c.dir
    if !isdirpath(dir)
        return throw(ArgumentError("$dir is not a valid directory"))
    end
    for (root, dirs, files) = walkdir(dir,follow_symlinks=follow_symlinks)
        for file in files 
            name = joinpath(root,file)
            m = match(c.pattern,name)
            if !isnothing(m)
                kill = true
                if !ismissing(c.exclude)
                    for k in c.exclude
                    if !isnothing(match(k,name))
                        kill = false
                        break
                    end 
                end
                end
                if kill == true 
                rm(name)
                end
            end    
        end
        
    end
end
export Cleaner
end
