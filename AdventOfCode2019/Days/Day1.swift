class Day1: Day {
    static func run(input: String) {
        let lines = splitInput(input)
        let part1 = part1FuelRequirements(lines: lines)
        let part2 = part2FuelRequirementsForFuel(lines: lines)

        print("Fuel requirements for modules, part 1: \(part1)")
        print("Fuel requirements for modules, including fuel mass, part 2: \(part2)")
    }

    static func part1FuelRequirements(lines: [String]) -> Double {
        lines.compactMap(Double.init)
             .map(fuelRequiredForMass)
             .reduce(into: 0, { $0 += $1 })
    }

    static func part2FuelRequirementsForFuel(lines: [String]) -> Double {
        lines.compactMap(Double.init)
             .map(recursiveFuelRequiredForMass)
             .reduce(into: 0, { $0 += $1 })
    }

    static func fuelRequiredForMass(mass: Double) -> Double {
        (mass / 3.0).rounded(.down) - 2
    }

    static func recursiveFuelRequiredForMass(mass: Double) -> Double {
        let fuelRequired = fuelRequiredForMass(mass: mass)
        guard fuelRequired > 0 else { return 0 }

        return fuelRequired + recursiveFuelRequiredForMass(mass: fuelRequired)
    }
}
