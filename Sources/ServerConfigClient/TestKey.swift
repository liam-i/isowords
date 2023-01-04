import Dependencies
import XCTestDynamicOverlay

extension DependencyValues {
  public var serverConfig: ServerConfigClient {
    get { self[ServerConfigClient.self] }
    set { self[ServerConfigClient.self] = newValue }
  }
}

extension ServerConfigClient: TestDependencyKey {
  public static let previewValue = Self.noop

  public static let testValue = Self(
    config: XCTUnimplemented("\(Self.self).config", placeholder: ServerConfig()),
    refresh: XCTUnimplemented("\(Self.self).refresh")
  )
}

extension ServerConfigClient {
  public static let noop = Self(
    config: { .init() },
    refresh: { try await Task.never() }
  )
}