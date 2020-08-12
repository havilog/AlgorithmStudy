var S = "cba"
var T = "abcd"

var output = ""

// Create a dictionary of T stating the characters and the amount of items
var dict = [Character: Int]()
for char in T {
    dict[char] = (dict[char] ?? 0) + 1
}

// iterate through S and decrement the amount letters in the dictionary
for char in S {
    if let value = dict[char] {
        // make sure to iterate though all instances of that specific character
        for _ in 0..<value {
            output.append(char)
        }
        dict[char] = 0
    }
}
//append the remaining items in the dictionary into the output
for (key, value) in dict {
    for _ in 0..<value {
        output.append(key)
    }
}
