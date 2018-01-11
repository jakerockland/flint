//
//  TypeError.swift
//  SemanticAnalyzer
//
//  Created by Franklin Schrans on 1/11/18.
//

import AST
import Diagnostic

extension Diagnostic {
  static func incompatibleReturnType(actualType: Type.RawType, expectedType: Type, expression: Expression) -> Diagnostic {
    return .incompatibleType(actualType: actualType, expectedType: expectedType, sourceLocation: expression.sourceLocation, useContext: "return")
  }

  static func incompatibleArgumentType(actualType: Type.RawType, expectedType: Type, argument: Expression) -> Diagnostic {
    return .incompatibleType(actualType: actualType, expectedType: expectedType, sourceLocation: argument.sourceLocation, useContext: "argument")
  }

  private static func incompatibleType(actualType: Type.RawType, expectedType: Type, sourceLocation: SourceLocation, useContext: String) -> Diagnostic {
    return Diagnostic(severity: .error, sourceLocation: sourceLocation, message: "Cannot convert expression of type \(actualType.name) to expected \(useContext) type \(expectedType.name)")
  }
}
