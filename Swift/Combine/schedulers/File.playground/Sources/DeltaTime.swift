import Foundation

let start = Date()
let deltaFormatter: NumberFormatter = {
  let f = NumberFormatter()
  f.negativePrefix = ""
  f.minimumFractionDigits = 1
  f.maximumFractionDigits = 1
  return f
}()

/// A simple delta time formatter suitable for use in playground pages: start date is initialized every time the page starts running
public var deltaTime: String {
  return deltaFormatter.string(for: Date().timeIntervalSince(start))!
}
