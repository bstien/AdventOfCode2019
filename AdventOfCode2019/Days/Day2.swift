class Day2: Day {
    static func run(input: String) {
        var program = splitInput(input, separator: ",").compactMap(Int.init)
        program[1] = 12
        program[2] = 2

        let part1 = part1ValueOfFirstIndexOnHalt(program: program)

        print("Value of index 0, part 1: \(part1)")
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
}

            }
        }
        return nil

private extension Array where Element == Int {
    func readValue(fromPointerAt index: Int) -> Int {
        self[self[index]]
    }
}
