class Day2: Day {
    static func run(input: String) {
        var program = splitInput(input, separator: ",").compactMap(Int.init)
        program[1] = 12
        program[2] = 2

        let part1 = part1ValueOfFirstIndexOnHalt(program: program)
        let part2 = part2InputsThatProducesAGivenValue(program: program)

        print("Value of index 0, part 1: \(part1)")
        print("Result of 100 * noun + verb, part 2: \(part2)")
    }

    static func part1ValueOfFirstIndexOnHalt(program: [Int]) -> Int {
        var program = program
        var currentIndex = 0

        while program[currentIndex] != 99 {
            let opCode1 = program.readValue(fromPointerAt: currentIndex + 1)
            let opCode2 = program.readValue(fromPointerAt: currentIndex + 2)
            let opCode3 = program[currentIndex + 3]

            switch program[currentIndex] {
            case 1: program[opCode3] = opCode1 + opCode2
            case 2: program[opCode3] = opCode1 * opCode2
            default: break
            }

            currentIndex += 4
        }

        return program[0]
    }

    static func part2InputsThatProducesAGivenValue(program: [Int]) -> Int {

        for noun in (0...99) {
            for verb in (0...99) {
                var program = program
                var currentIndex = 0
                program[1] = noun
                program[2] = verb

                while program[currentIndex] != 99 {
                    let opCode1 = program.readValue(fromPointerAt: currentIndex + 1)
                    let opCode2 = program.readValue(fromPointerAt: currentIndex + 2)
                    let opCode3 = program[currentIndex + 3]

                    switch program[currentIndex] {
                    case 1: program[opCode3] = opCode1 + opCode2
                    case 2: program[opCode3] = opCode1 * opCode2
                    default: break
                    }
                    currentIndex += 4
                }

                if program[0] == 19690720 {
                    return 100 * noun + verb
                }
            }
        }

        return 0
    }
}

private extension Array where Element == Int {
    func readValue(fromPointerAt index: Int) -> Int {
        self[self[index]]
    }
}
