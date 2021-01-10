var S = "cba"
var T = "abcd"

var output = ""

var dict = [Character: Int]()
for char in T {
    dict[char] = (dict[char] ?? 0) + 1
}

for char in S {
    if let value = dict[char] {
        for _ in 0..<value {
            output.append(char)
        }
        dict[char] = 0
    }
}

for (key, value) in dict {
    for _ in 0..<value {
        output.append(key)
    }
}

print(output)