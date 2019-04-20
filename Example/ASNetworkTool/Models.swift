//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  Models.swift 
//  Deeeeeemo 
// 
//  Created by Ari on 2018/8/24. 
//  Copyright © 2018年 阿狸. All rights reserved. 	
// 

import Foundation
import HandyJSON
//import Moya
import ASNetworkTool

struct Book: ASRequestProtocol{
//    typealias API = XAPI
    
    struct Rating: HandyJSON {
//        init() {}
        var max: Int = 0
        var numRaters: Int = 0
        var average: Int = 0
        var min: Int = 0
        
    }
    struct Tags: HandyJSON {
        var count = 0
        var name = ""
        var title = ""
    }
    var rating: Rating?
    var subtitle = ""
    var author: [String]?
    var pubdate = ""
    var tags: [Tags] = []
    var origin_title = ""
    var image = ""
    var binding = ""
    var catalog = ""
    var pages = 0
    var id = 0
    var alt = ""
    var publisher = ""
    var title = ""
    var url = ""
    var summary = ""
    var price = 0.0
    
}

