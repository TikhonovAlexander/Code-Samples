import UIKit

//Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
//The number of elements initialized in nums1 and nums2 are m and n respectively.
//You may assume that nums1 has enough space (size that is equal to m + n) to hold additional elements from nums2.

// Input:
// nums1 = [1,2,3,0,0,0], m = 3
// nums2 = [2,5,6],       n = 3
// Output: [1,2,2,3,5,6]

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

    var i = m - 1
    var j = n - 1
    var k = m + n - 1

    while k >= 0, j >= 0 {
        if i >= 0, nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            nums1[k] = nums2[j]
            j -= 1
        }
        k -= 1
    }

}

var arr = [1,2,3,0,0,0]
var arr2 = [2,5,6]
merge(&arr, 3, arr2, 3)

print(arr)
