protocol Functor {
    typealias A
    typealias FB
    func fmap<B>(A -> B) -> FB
}