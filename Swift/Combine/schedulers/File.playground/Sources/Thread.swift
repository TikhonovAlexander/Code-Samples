import Foundation

fileprivate enum Regexes {
    static let threadNumber = try! NSRegularExpression(pattern: "number = (\\d+)", options: .caseInsensitive)
}

extension Thread {
    public var number: Int {
        let desc = self.description
        if let numberMatches = Regexes.threadNumber.firstMatch(in: desc, range: NSMakeRange(0, desc.count)) {
            let s = NSString(string: desc).substring(with: numberMatches.range(at: 1))
            return Int(s) ?? 0
        }
        return 0
    }
}
