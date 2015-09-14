//
//  Examples.swift
//  Rack
//
//  Created by John Smilanick on 9/13/15.
//  Copyright (c) 2015 John Smilanick. All rights reserved.
//

import Foundation

class Middleware : RackMiddleware {
    let app : RackApp
    
    required init(app: RackApp) {
        self.app = app
    }
    
    func call(env: Rack.Env) -> Rack.Response {
        return app.call(env)
    }
}
