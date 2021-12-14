//
//  keebdata.swift
//  KeebLog
//
//  Created by Casey Thatsanaphonh on 12/3/21.
//

import Foundation
import UIKit


// keyboard class
/*
 * Build name
 * Keyboard cost
 * Bool groupbuy?
 * picture in db?
 */

//// Feature to be added later
//class KeebPhotoGallery{
//    var keebPic : UIImage?
//}


class Keyboard{
    let id = UUID().uuidString
    var nameOfKeeb : String
    var costOfKeeb : Int
    var keebSwitch : String
    

    // Initializing functions:
    init(){
        nameOfKeeb = ""
        costOfKeeb = 0
        keebSwitch = ""
    }
    
    init(name : String, cost : Int, switchName : String)
    {
        nameOfKeeb = name
        costOfKeeb = cost
        keebSwitch = switchName
    }
}
