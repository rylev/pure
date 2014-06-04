enum Maybe<T> {
    case Just(T)
    case None

    // Functor
    func fmap<R>(fn: (T) -> (R)) -> Maybe<R> {
        switch self {
            case let .Some(x): return Maybe<R>.Some(fn(x))
            case .None: return .None
        }
    }

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