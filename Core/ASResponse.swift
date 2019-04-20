//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  ASResponse.swift 
//  ASNetworkTool_Example 
// 
//  Created by Ari on 2018/9/19. 
//  Copyright © 2018年 CocoaPods. All rights reserved. 	
// 

import Foundation
public struct ASDataResponse<T>: ASRequestProtocol where T: ASJSON {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: T?
}
public struct ASListResponse<T>: ASRequestProtocol where T: ASJSON {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: [T] = []
}
public struct ASMsgResponse:  ASRequestProtocol {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: String?
}
