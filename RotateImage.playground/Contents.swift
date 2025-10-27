import Cocoa

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        // perform transpose of the original matrix
        for i in 0..<matrix.count {
            for j in i..<matrix.count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        // reverse row
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
    }
    
    func printMatrix(_ matrix: [[Int]]) {
        for line in matrix {
            print(line)
        }
    }
}

let solution = Solution()
var matrix = [[1,2,3],[4,5,6],[7,8,9]]
//solution.rotate(&matrix)

var matrix1 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
solution.printMatrix(matrix1)
print("\n")
solution.rotate(&matrix1)
solution.printMatrix(matrix1)
