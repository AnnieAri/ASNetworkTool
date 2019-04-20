//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  XAPI.swift 
//  Deeeeeemo 
// 
//  Created by Ari on 2018/8/24. 
//  Copyright © 2018年 阿狸. All rights reserved. 	
// 

import Foundation
import ASNetworkTool
///https://api.douban.com/v2/book/1220562
enum XAPI {
    case getBook
}
extension XAPI: ASTargetType {
    var baseURL: URL {
        return URL(string: "https://api.douban.com")!
    }
    
    var path: String {
        return "/v2/book/1220562"
    }
    
    var method: ASMethod {
        return .post
    }
    /// 这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    /// 这个就是API里面的核心。嗯。。至少我认为是核心，因为我就被这个坑过
    //类似理解为AFN里的URLRequest
    var task: ASTask {
//        return ASTask.requestPlain
        return .requestParameters(parameters: [:], encoding: URLEncoding.default)
//        return .requestPlain
    }
    ///请求头
    var headers: [String : String]? {
        //同task，具体选择看后台 有application/x-www-form-urlencoded 、application/json
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    
}
