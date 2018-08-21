//
//  Identifier.swift
//  AST
//
//  Created by Hails, Daniel J R on 21/08/2018.
//

/// The raw representation of an `Identifier`.
public typealias RawTypeIdentifier = String

/// An identifier for a contract, struct, variable, or function.
public struct Identifier: Hashable, SourceEntity {
  public var identifierToken: Token
  public var enclosingType: String? = nil

  public var name: String {
    guard case .identifier(let name) = identifierToken.kind else { fatalError() }
    return name
  }

  public var sourceLocation: SourceLocation {
    return identifierToken.sourceLocation
  }

  public init(identifierToken: Token) {
    self.identifierToken = identifierToken
  }

  public init(name: String, sourceLocation: SourceLocation = SourceLocation(line: 0, column: 0, length: 0, file: .init(fileURLWithPath: ""))) {
    self.identifierToken = Token(kind: .identifier(name), sourceLocation: sourceLocation)
  }

  public var hashValue: Int {
    return "\(name)_\(sourceLocation)".hashValue
  }
}
