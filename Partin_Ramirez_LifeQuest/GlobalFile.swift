//
//  GlobalFile.swift
//  Partin_Ramirez_LifeQuest
//
//  Created by Period Three on 2019-01-11.
//  Copyright © 2019 Gibran Ramirez. All rights reserved.
//

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


