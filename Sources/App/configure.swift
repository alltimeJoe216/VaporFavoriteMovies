import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("VAPOR_USERNAME") ?? "joev",
        password: Environment.get("VAPOR_PASSWORD") ?? "password",
        database: Environment.get("VAPOR_DATABASE") ?? "favmoviesdb"
    ), as: .psql)

    app.migrations.add(CreateMovie())

    // register routes
    try routes(app)
}
