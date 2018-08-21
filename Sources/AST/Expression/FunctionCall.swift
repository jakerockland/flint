//
//  FunctionCall.swift
//  AST
//
//  Created by Hails, Daniel J R on 21/08/2018.
//

/// A call to a function.
public struct FunctionCall: SourceEntity {
  public var identifier: Identifier
  public var arguments: [Expression]
  public var closeBracketToken: Token

  public var sourceLocation: SourceLocation {
    return .spanning(identifier, to: closeBracketToken)
  }

  public var mangledIdentifier: String? = nil

  public init(identifier: Identifier, arguments: [Expression], closeBracketToken: Token) {
    self.identifier = identifier
    self.arguments = arguments
    self.closeBracketToken = closeBracketToken
  }
}
