//	
//        _                  _     ______                  _       ___    _    
//       / \                (_)  .' ____ \                (_)    .' ..]  / |_  
//      / _ \      _ .--.   __   | (___ \_|  _   _   __   __    _| |_   `| |-' 
//     / ___ \    [ `/'`\] [  |   _.____`.  [ \ [ \ [  ] [  |  '-| |-'   | |   
//   _/ /   \ \_   | |      | |  | \____) |  \ \/\ \/ /   | |    | |     | |,  
//  |____| |____| [___]    [___]  \______.'   \__/\__/   [___]  [___]    \__/ 
//  ASNetworkTool.swift 
//  ASNetworkTool.swift
// 
//  Created by Ari on 2018/8/24. 
//  Copyright © 2018年 AriSwift. All rights reserved. 	
// 

import Foundation
import HandyJSON
import Moya
import Alamofire

public typealias ASMethod = Moya.Method
public typealias ASTask = Moya.Task
public typealias URLEncoding = Alamofire.URLEncoding
public typealias JSONEncoding = Alamofire.JSONEncoding
public typealias MultipartFormData = Moya.MultipartFormData
public typealias FormDataProvider = Moya.MultipartFormData.FormDataProvider
public typealias PropertyListEncoding = Alamofire.PropertyListEncoding

public struct ASMultipartFile {
    public init(data: Data,name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
    public var data: Data
    public var name: String
    public var fileName: String?
    public var mimeType: String?
}

public protocol ASTargetType {
    var baseURL: URL {get}
    
    var path: String {get}
    
    var method: ASMethod {get}
    
    var sampleData: Data {get}
    
    var task: ASTask {get}
    
    var headers: [String : String]? {get}
    
}

public extension ASTargetType {
    var sampleData: Data {return Data()}
    var method: ASMethod {return .post}
}


public protocol ASJSON: HandyJSON {}

public protocol ASJSONCustomTransformable: HandyJSONCustomTransformable {}
public protocol ASJSONEnum: HandyJSONEnum {}

public protocol ASRequestProtocol: ASJSON {
     static func request(api: ASTargetType, success: ((Self)->())?, failure: ((ASError)->())?)
}

public extension ASRequestProtocol where Self: ASJSON {
    static func request(api: ASTargetType, success: ((Self)->())?, failure: ((ASError)->())?) {
        let API = Transform_target(proxy: api)
        let provider = MoyaProvider<Transform_target>()
        provider.request(API) { (res) in
            switch res {
            case .success(let a):
                let jsonStr = String(data: a.data, encoding: .utf8)
                #if DEBUG
                print("url: \(api.path)")
                print("response:")
                print(jsonStr ?? "")
                #endif
                guard let res = self.self.deserialize(from: jsonStr) else {
                    failure?(.deserializeFailed)
                    return
                }
                success?(res)
            case .failure:
                failure?(.requestFailed)
            }
        }
    }
    
    static func request(api: ASTargetType, result: @escaping ((ASResult<Self>)->())){
        let API = Transform_target(proxy: api)
        let provider = MoyaProvider<Transform_target>()
        provider.request(API) { (res) in
            switch res {
            case .success(let a):
                let jsonStr = String(data: a.data, encoding: .utf8)
                #if DEBUG
                print("url: \(api.path)")
                print("response:")
                print(jsonStr ?? "")
                #endif
                guard let res = self.self.deserialize(from: jsonStr) else {
                    result(.failure(.deserializeFailed))
                    return
                }
                result(.success(res))
            case .failure:
                result(.failure(.requestFailed))
            }
        }
    }
}
