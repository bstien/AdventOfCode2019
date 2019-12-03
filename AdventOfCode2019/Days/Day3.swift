class Day3: Day {
    static func run(input: String) {
        let input = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

        let cables = splitInput(input)
            .map { splitInput($0, separator: ",") }
            .map { $0.compactMap(CableSegment.init) }

        let part1 = part1ManhattanDistanceToNearestIntersection(using: cables)

        print("Manhattan distance to nearest intersection, part 1: \(part1)")
    }

    static private func part1ManhattanDistanceToNearestIntersection(using cables: [[CableSegment]]) -> Int {
        for cable in cables {
            for segment in cable {

            }
        }
        return 0
    }
}


private enum Direction {
    case up, down, left, right

    init?(rawValue: Character) {
        switch rawValue.lowercased() {
        case "u": self = .up
        case "d": self = .down
        case "r": self = .right
        case "l": self = .left
        default: return nil
        }
    }
}

private struct CableSegment {
    let direction: Direction
    let length: Int

    init?(_ input: String) {
        guard
            let directionCharacter = input.first,
            let direction = Direction(rawValue: directionCharacter),
            let length = Int(input.dropFirst())
        else { return nil }

        self.direction = direction
        self.length = length
    }
}
