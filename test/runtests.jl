using ellistools
using Test

@testset "gettypes" begin

    @testset "Primitive Types" begin
        @test gettypes("a") == String
        @test gettypes(1) == Int64
        @test gettypes(true) == Bool
    end

    @testset "Collections" begin
        d = Dict("string" => "a", "int" => 1, "bool" => true)
        @test gettypes(d) == Dict("string" => String, "int" => Int64, "bool" => Bool)
        a = ["string", 1, true]
        @test gettypes(a) == [String, Int64, Bool]
        nested = Dict("a" => [Dict("k" => "hello")])
        @test gettypes(nested) == Dict("a" => [Dict("k" => String)])
    end

end
