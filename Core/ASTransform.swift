//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  ASTransform.swift 
//  ASNetworkTool_Example 
// 
//  Created by Ari on 2018/8/27. 
//  Copyright © 2018年 CocoaPods. All rights reserved. 	
// 

import Foundation
import Moya
struct Transform_target: TargetType {
    var proxy: ASTargetType
    init(proxy: ASTargetType) {
        self.proxy = proxy
    }
    var baseURL: URL {
        return proxy.baseURL
    }
    
    var path: String {
        return proxy.path
    }
    
    var method: Moya.Method {
        return proxy.method
    }
    
    var sampleData: Data {
        return proxy.sampleData
    }
    
    var task: Task {
        return proxy.task
    }
    
    var headers: [String : String]? {
        return proxy.headers
    }
    
    
}
struct Transform_origin: ASTargetType {
    
    var baseURL: URL
    
    var path: String
    
    var method: ASMethod
    
    var sampleData: Data
    
    var task: ASTask
    
    var headers: [String : String]?
    
    
}
