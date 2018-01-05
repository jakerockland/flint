//
//  IULIACanonicalType.swift
//  IULIABackend
//
//  Created by Franklin Schrans on 12/29/17.
//

import AST

enum CanonicalType: String {
  case uint256
  case address

  init?(from rawType: Type.RawType) {
    switch rawType {
    case .builtInType(let builtInType):
      switch builtInType {
      case .address: self = .address
      }
    case .userDefinedType(let userDefinedType):
      switch userDefinedType {
      case "Ether": self = .uint256
      case "Int": self = .uint256
      default: return nil
      }
    case .arrayType(_): return nil
    }
  }
}
