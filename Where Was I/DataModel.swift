//
//  DataModel.swift
//  Where Was I
//
//  Created by Alexey Yarov on 25/06/2021.
//  Copyright © 2021 Alexey Yarov. All rights reserved.
//

import Foundation

class VisitedPoint {
    
    var latitude: String  //string, due to easyer storage String method
    var longitude: String
    
    init(lat: String, long: String){
        self.latitude = lat
        self.longitude = long
    }
    
}
