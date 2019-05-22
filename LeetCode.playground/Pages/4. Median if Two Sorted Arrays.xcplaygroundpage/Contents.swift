/*:
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 
     nums1 = [1, 3]
     nums2 = [2]
 
     The median is 2.0
 
 Example 2:
 
     nums1 = [1, 2]
     nums2 = [3, 4]
 
     The median is (2 + 3)/2 = 2.5
 */

//: [Previous](@previous)

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count, n = nums2.count
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }
        var imin = 0, imax = m
        while imin <= imax {
            let i = (imin + imax) / 2, j = (m + n + 1) / 2 - i
            if i < m && nums2[j - 1] > nums1[i] {
                imin = i + 1
            } else if i > 0 && nums1[i - 1] > nums2[j] {
                imax = i - 1
            } else {
                var maxleft = 0, minright = 0
                if i == 0 {
                    maxleft = nums2[j - 1]
                } else if j == 0 {
                    maxleft = nums1[i - 1]
                } else {
                    maxleft = max(nums1[i - 1], nums2[j - 1])
                }

                if (m + n) % 2 == 1 {
                    return Double(maxleft)
                }

                if i == m {
                    minright = nums2[j]
                } else if j == n {
                    minright = nums1[i]
                } else {
                    minright = min(nums1[i], nums2[j])
                }

                return Double(minright + maxleft) / 2.0
            }
        }
        return 0.0
    }
}


Solution().findMedianSortedArrays([1, 3], [2])
Solution().findMedianSortedArrays([1, 2], [3, 4])
//: [Next](@next)



//: [Next](@next)
