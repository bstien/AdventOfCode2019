class Day1: Day {
    static func run(input: String) {
        let lines = splitIntoLines(input: input)
        let part1 = part1FuelRequirements(lines: lines)

        print("Fuel requirements for modules, part 1: \(part1)")
    }

    static func part1FuelRequirements(lines: [String]) -> Double {
        lines.compactMap(Double.init)
             .map { ($0 / 3.0).rounded(.down) - 2 }
             .reduce(into: 0, { $0 += $1 })
    }
}
