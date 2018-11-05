"""
    gettypes(x)

Returns the type of `x` or, if `x` is a collection (e.g. Dict or Array), the
types of contents within the collection.
"""
gettypes(x::Any) = typeof(x)
gettypes(x::Array) = gettypes.(x)
function gettypes(x::Dict)
    d = Dict()
    for (k, v) in x
        d[k] = gettypes(v)
    end
    return d
end
