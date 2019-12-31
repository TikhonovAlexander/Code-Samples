import SwiftUI
import Combine

public enum Event: Equatable, CustomDebugStringConvertible {
  case value
  case completion
  case failure

  public var debugDescription: String {
    switch self {
    case .value: return "value"
    case .completion: return "completion"
    case .failure: return "failure"
    }
  }
}
