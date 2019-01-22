
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

struct Task: Codable {
    var title: String
    var completed : Bool
}
struct Goal: Codable {
    var title: String
    var done: Bool
}
struct SocialLink: Codable {
    var name: String
    var met: Bool
}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let archiveURL2 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist2")
let archiveURL3 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist3")
let archiveURL4 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist4")
let archiveURL5 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist5")

func saveData() {
    let pListEncoder = PropertyListEncoder()
    let encodedItem = try? pListEncoder.encode(theTaskArray)
    try? encodedItem?.write(to: archiveURL, options: .noFileProtection)
    
    let newEncodedItem = try? pListEncoder.encode(theGoalArray)
    try? newEncodedItem?.write(to: archiveURL2, options: .noFileProtection)
    
    let evenNewerEncodedItem = try? pListEncoder.encode(theLinkArray)
    try? evenNewerEncodedItem?.write(to: archiveURL3, options: .noFileProtection)
    
    let veryNewEncodedItem = try? pListEncoder.encode(level)
    try? veryNewEncodedItem?.write(to: archiveURL3, options: .noFileProtection)
    
    let extremleyNewEncodedItem = try? pListEncoder.encode(currentXP)
    try? extremleyNewEncodedItem?.write(to: archiveURL3, options: .noFileProtection)
}

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
        pListDecoder.decode(Int.self, from: retrivedItemsData) {
        level = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL5), let decodedNotes = try?
        pListDecoder.decode(Int.self, from: retrivedItemsData) {
        currentXP = decodedNotes
    }
}
