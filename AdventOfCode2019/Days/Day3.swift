class Day3: Day {
    static func run(input: String) {
        let cables = splitInput(input)
            .map { splitInput($0, separator: ",") }
            .map { $0.compactMap(CableSegment.init) }
            .map { Cable(segments: $0) }

        let part1 = part1ManhattanDistanceToNearestIntersection(using: cables)
        let part2 = part2NumberOfStepsToNearestIntersection(using: cables)

        print("Manhattan distance to nearest intersection, part 1: \(part1)")
        print("Number of steps to first intersection, part 2: \(part2)")
    }

    static private func part1ManhattanDistanceToNearestIntersection(using cables: [Cable]) -> Int {
        let cableA = Set(traverseCable(cable: cables[0]))
        let cableB = Set(traverseCable(cable: cables[1]))
        return cableA.intersection(cableB).map({ abs($0.x) + abs($0.y) }).min() ?? 0
    }

    static private func part2NumberOfStepsToNearestIntersection(using cables: [Cable]) -> Int {
        let cableA = traverseCable(cable: cables[0])
        let cableB = traverseCable(cable: cables[1])

        let intersections = Set(cableA).intersection(Set(cableB))
        return intersections.compactMap { point -> Int? in
            guard
                let a = cableA.firstIndex(of: point),
                let b = cableB.firstIndex(of: point)
            else { return nil }

            return a+b+2
        }.min() ?? 0
    }

    static private func traverseCable(cable: Cable) -> [Point] {
        var x = 0
        var y = 0

        return cable.segments.flatMap { segment in
            (0..<segment.length).map { _ in
                x += 1 * segment.direction.movement.x
                y += 1 * segment.direction.movement.y
                return Point(x: x, y: y)
            }
        }
    }
}

private struct Point: Hashable {
    let x: Int
    let y: Int
}

private struct Cable {
    let segments: [CableSegment]
}

private enum Direction {
    case up, down, left, right

    var movement: (x: Int, y: Int) {
        switch self {
        case .up: return (x: 0, y: -1)
        case .down: return (x: 0, y: 1)
        case .right: return (x: 1, y: 0)
        case .left: return (x: -1, y: 0)
        }
    }

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
