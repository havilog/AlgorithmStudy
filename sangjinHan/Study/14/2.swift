func solution(_ s:String) -> Bool {
    guard s.count == 4 || s.count == 6 else {
        return false
    }

    for char in s{
        if char.isNumber {
            continue
        } else{
            return false
        }
    }

    return true
}