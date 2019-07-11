//
//  Page.swift
//  CV_APP
//
//  Created by David Parra on 7/10/19.
//  Copyright © 2019 David Parra. All rights reserved.
//

import Foundation

class Page{
    let imageName: String
    let headerText: String
    let descriptionText : String
    let date: String
    init(name: String, header: String, description: String, date: String) {
        imageName = name
        headerText = header
        descriptionText = description
        self.date = date
    }
}
