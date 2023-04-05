//
//  Usuario.swift
//  Leilao
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class User {
    
    let id:Int?
    let name:String
    
    init(id:Int? = nil, name:String) {
        self.id = id
        self.name = name
    }
}
