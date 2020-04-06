import UIKit

// Given an array of strings, group anagrams together.

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()
    for str in strs {
        let key = String(str.sorted())
        if var arr = dict[key] {
            arr.append(str)
            dict[key] = arr
        } else {
            dict[key] = [str]
        }
    }
    return Array(dict.values)
}

groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
