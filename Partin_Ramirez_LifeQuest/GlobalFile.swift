
import Foundation


let levelUpXP = 500
let defaultXp = 250
let defaultlevel = 1

var level = defaultlevel
var currentXP = defaultXp
var bleName = String()

var num = 1
var theTaskArray: [Task] = []
var theGoalArray: [Goal] = []
var theLinkArray: [SocialLink] = []

func levelUp(gained: Int){
    currentXP += gained
    if currentXP >= levelUpXP {
        level += 1
        currentXP -= 500
    }
}

struct Task {
    var title: String
    var completed : Bool
}
struct Goal {
    var title: String
    var done: Bool
}
struct SocialLink {
    var name: String
    var met: Bool
}
