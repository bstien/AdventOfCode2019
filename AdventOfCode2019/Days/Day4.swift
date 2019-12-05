class Day4: Day {
    static func run(input: String) {
        let input = splitInput(input, separator: "-").compactMap(Int.init)
        let part1 = part1NumberOfMatchingPasswords(from: input[0], to: input[1])

        print("Number of matching passwords, part 1: \(part1)")
    }

    private static func part1NumberOfMatchingPasswords(from: Int, to: Int) -> Int {
        (from...to)
            .map { $0.description }
            .map { $0.digits }
            .filter({
                var hasDoubleDigits = false

                for index in (0..<$0.count - 1) {
                    if $0[index] > $0[index+1] { return false }

                    if $0[index] == $0[index+1] { hasDoubleDigits = true }
                }

                return hasDoubleDigits
            })
            .count
    }
}

extension StringProtocol  {
    var digits: [Int] { compactMap{ $0.wholeNumberValue } }
}
