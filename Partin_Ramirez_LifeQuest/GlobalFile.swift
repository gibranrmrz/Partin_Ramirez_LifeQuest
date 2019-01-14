
import Foundation


let levelUpXP = 500
let defaultXp = 250
let defaultlevel = 1

var level = defaultlevel
var currentXP = defaultXp

func levelUp(){
    if currentXP >= levelUpXP {
        level += 1
        currentXP -= 500
    }
}



