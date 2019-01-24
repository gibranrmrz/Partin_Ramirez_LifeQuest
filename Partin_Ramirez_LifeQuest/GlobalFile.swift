
import Foundation

//creates values for the xp and levels
let levelUpXP = 500
let defaultXp = 200
let defaultlevel = 1

//creates an item of type user
var thisUser = User(level: defaultlevel, currentXP: defaultXp)

//creates a number to determine what the item is being made for
var num = 1

//makes arrays for the 3 different items
var theTaskArray: [Task] = []
var theGoalArray: [Goal] = []
var theLinkArray: [SocialLink] = []

//function that changes xp values and levels
func levelUp(gained: Int){
    thisUser.currentXP += gained
    if thisUser.currentXP >= levelUpXP {
        thisUser.level += 1
        thisUser.currentXP -= 500
    }
}

//structure for a user
struct User: Codable {
    var level: Int
    var currentXP: Int
}

//strucuture that makes daily tasks, goals, and social links
struct Task: Codable {
    var title: String
}
struct Goal: Codable {
    var title: String
}
struct SocialLink: Codable {
    var name: String
}

//creates paths to save 4 data items
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let archiveURL2 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist2")
let archiveURL3 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist3")
let archiveURL4 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist4")

//saves data using the plist encoder
func saveData() {
    let pListEncoder = PropertyListEncoder()
    let encodedItem = try? pListEncoder.encode(theTaskArray)
    try? encodedItem?.write(to: archiveURL, options: .noFileProtection)
    
    let newEncodedItem = try? pListEncoder.encode(theGoalArray)
    try? newEncodedItem?.write(to: archiveURL2, options: .noFileProtection)
    
    let evenNewerEncodedItem = try? pListEncoder.encode(theLinkArray)
    try? evenNewerEncodedItem?.write(to: archiveURL3, options: .noFileProtection)
    
    let veryNewEncodedItem = try? pListEncoder.encode(thisUser)
    try? veryNewEncodedItem?.write(to: archiveURL4, options: .noFileProtection)
}

//loads data using the plist encoder
func loadData() {
    let pListDecoder = PropertyListDecoder()
    if let retrivedItemsData = try? Data(contentsOf: archiveURL), let decodedNotes = try?
        pListDecoder.decode(Array<Task>.self, from: retrivedItemsData) {
        theTaskArray = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL2), let decodedNotes = try?
        pListDecoder.decode(Array<Goal>.self, from: retrivedItemsData) {
        theGoalArray = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL3), let decodedNotes = try?
        pListDecoder.decode(Array<SocialLink>.self, from: retrivedItemsData) {
        theLinkArray = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL4), let decodedNotes = try?
        pListDecoder.decode(User.self, from: retrivedItemsData) {
        thisUser = decodedNotes
    }
}
