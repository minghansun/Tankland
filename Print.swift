import Foundation
import Glibc

struct Coord{
    let x: Int
    let y: Int
}

class GO{
    var location: Coord
    let name: String
    let energy: Int
    let type: String

    init(x: Int, y: Int, name: String, type: String, energy: Int){
        location = Coord(x: x, y: y)
        self.energy = energy
        self.name = name
        self.type = type
    }
}

class Grid{
    var grid = [[GO?]](repeating: [GO?](repeating: nil, count: 15), count: 15)
    func formatToGrid(_ value: String)-> String{
        var yes = ""
        for _ in 0..<9 - value.count{
            yes += " "
        }
        yes += value + "|"
        return yes
    }
    func printGrid(){
        for y in 0...14{
            var row0 = "_"
            var row1 = "|"
            var row2 = "|"
            var row3 = "|"
            var row4 = "|"
            for x in 0...14{
                row0 += "__________"
                if let thing = grid[y][x]{
                    row1 += formatToGrid(thing.name)
                    row2 += formatToGrid(String(thing.energy))
                    row3 += formatToGrid("(\(y), \(x))")
                    row4 += formatToGrid(thing.type)
                }
                else{
                    row1 += "         |"
                    row2 += "         |"
                    row3 += "         |"
                    row4 += "         |"
                }
            }
            print(row0)
            print(row1)
            print(row2)
            print(row3)
            print(row4)
        }
    }
}
