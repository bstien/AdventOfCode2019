class Day3: Day {
    static func run(input: String) {
        let cables = splitInput(input).map { splitInput($0, separator: ",")}

        let part1 = part1ManhattanDistanceToNearestIntersection(using: cables)

        print("Manhattan distance to nearest intersection, part 1: \(part1)")
    }

    static private func part1ManhattanDistanceToNearestIntersection(using cables: [[String]]) -> Int {
        for cable in cables {

        }
        return 0
    }
}
