enum Maybe<T> {
    case Just(T)
    case None

    func maybe(def: T, fn: (T) -> (T)) -> T {
        switch self {
            case let Just(x): return fn(x)
            case None: return def
        }
    }

    func fromMaybe(def: T) -> T {
        switch self {
            case let Just(x): return x
            case None: return def
        }
    }
}

func listToMaybe<T>(list: Array<T>) -> Maybe<T> {
    if list.count != 0 {
        return .Just(list[0])
    } else {
        return .None
    }
}