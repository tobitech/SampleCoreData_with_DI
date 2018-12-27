//
//  Friend.swift
//  CoreDataGenerateObjectsManual
//
//  Created by Oluwatobi Omotayo on 27/12/2018.
//  Copyright © 2018 Hollaport. All rights reserved.
//

import Foundation

extension Friend: User {
    var username: String {
        return nickname ?? ""
    }
    
    var displayName: String {
        return "\(firstname ?? "") \(lastname ?? "")"
    }
    
}
