//
//  Rack.swift
//  Rack
//
//  Created by John Smilanick on 9/13/15.
//  Copyright (c) 2015 John Smilanick. All rights reserved.
//

import Foundation

protocol RackApp {
    func call(env: Rack.Env) -> Rack.Response
}

protocol RackMiddleware {
    init(app: RackApp)
    func call(env: Rack.Env) -> Rack.Response
    
}

class Rack {
    typealias Code = Int
    typealias Body = [String] // multi-part body
    typealias Header = [String : String]
    typealias Response = (Int, Header, Body)
    typealias Params = [String : AnyObject]
    
    enum Method : String {
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
        case HEAD = "HEAD"
        case OPTIONS = "OPTIONS"
        case TRACE = "TRACE"
        case CONNECT = "CONNECT"
    }
    
    class Env {
        let ParsedParamsKey = "rack.parsedParams"
        
        let server : String = ""
        let host : String = ""
        let port : Int = 80
        let scheme : String = ""
        let ssl : Bool = false
        
        let method : Method = .GET
        let header : Header = [:]
        let path : String = ""
        let query : String = ""
        var userData : [String: AnyObject] = [:]
        
        func params() -> Params {
            var parsedParams = self.userData[ParsedParamsKey] as? Params
            if parsedParams == nil {
                var newParsedParams = Rack.parseNestedQuery(query)
                self.userData["ParsedParamsKey"] = newParsedParams
                return newParsedParams
            }
            return parsedParams!
        }
    }
    
    
    // Utils
    
    class func parseNestedQuery(query : String) -> Params {
        var params = Params()
        return params
    }
}
