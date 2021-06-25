//
//  DataStore.swift
//  Where Was I
//
//  Created by Alexey Yarov on 25/06/2021.
//  Copyright © 2021 Alexey Yarov. All rights reserved.
//

import Foundation

struct StorageKeys {
    static let storedLat = "storedLat"  //static means that this prop belongs to structure
    static let storedLong = "storedLong"
}

class DataStore {
    func GetDefaults () -> UserDefaults {
        return UserDefaults.standard
    }
    func StoreDataPoint (latitude: String, longitude: String) {
        let def = GetDefaults()
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize() //we need to save those items in system
    }
    func GetLastLocation () -> VisitedPoint? {
        let defaults = GetDefaults()
        
        if let lat = defaults.string(forKey: StorageKeys.storedLat){
            if let long = defaults.string(forKey: StorageKeys.storedLong){
                return VisitedPoint (lat: lat, long: long)
            }
        }
        return nil
    }
    
    
}
