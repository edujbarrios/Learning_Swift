import Vapor

struct TestingController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("hello_tittle", use: Testing_tittle)
    }

    func Testing_tittle(_ req: Request) throws -> String {
        return "Testing"
    }
}
