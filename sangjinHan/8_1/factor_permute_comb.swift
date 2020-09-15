func factorial(_ n: Int) -> Int {
  var n = n
  var result = 1
  while n > 1 {
    result *= n
    n -= 1
  }
  return result
}
factorial(5) // returns 120

//combination
func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(), k: k)

    return ret
}

func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
    return combos(elements: ArraySlice(elements), k: k)
}

let numbers = [1,2,3,4,5]
print(combos(elements:numbers,k:5))



//combination numbers
func combinations(_ n: Int, choose k: Int) -> Int {
  return permutations(n, k) / factorial(k)
}


//permutation
func permuteWirth<T>(_ a: [T], _ n: Int) {
    if n == 0 {
        print(a)   // display the current permutation
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

let letters = ["a", "b", "c"]
permuteWirth(letters, letters.count - 1)