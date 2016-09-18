infix operator |> { associativity left precedence 150 }

//MARK:- RawRepresentable

public func |> <T: RawRepresentable>(map: Mapper, key: String) throws -> T {
    return try map.from(key)
}

public func |> <T: RawRepresentable>(map: Mapper, key: String) -> T? {
    return map.from(key)
}

public func |> <T: RawRepresentable where T.RawValue:Convertible, T.RawValue == T.RawValue.ConvertedType>(map: Mapper, key: String) throws -> [T] {
    return try map.from(key)
}

public func |> <T: RawRepresentable where T.RawValue:Convertible, T.RawValue == T.RawValue.ConvertedType>(map: Mapper, key: String) -> [T]? {
    return map.from(key)
}



//MARK:- Convertible

public func |> <T:Convertible where T == T.ConvertedType>(map: Mapper, key: String) throws -> T {
    return try map.from(key)
}

public func |> <T:Convertible where T == T.ConvertedType>(map: Mapper, key: String) -> T? {
    return map.from(key)
}

public func |> <T:Convertible where T == T.ConvertedType>(map: Mapper, key: String) throws -> [T] {
    return try map.from(key)
}

public func |> <T:Convertible where T == T.ConvertedType>(map: Mapper, key: String) -> [T]? {
    return map.from(key)
}

public func |> <U:Convertible, T:Convertible where U == U.ConvertedType, T == T.ConvertedType>(map: Mapper, key: String) -> [U:T]?{
    return map.from(key)
}

public func |> <U:Convertible, T:Convertible where U == U.ConvertedType, T == T.ConvertedType>(map: Mapper, key: String) throws -> [U:T]{
    return try map.from(key)
}


//MARK:- Mappable

public func |> <T : Mappable>(map: Mapper, key: String) throws -> T {
    return try map.from(key)
}

public func |> <T : Mappable>(map: Mapper, key: String) -> T? {
    return map.from(key)
}


public func |> <T : Mappable>(map: Mapper, key: String) throws -> [T] {
    return try map.from(key)
}

public func |> <T : Mappable>(map: Mapper, key: String) -> [T]? {
    return map.from(key)
}