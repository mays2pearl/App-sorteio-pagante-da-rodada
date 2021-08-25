//
//  Historico.swift
//  iPayBF
//
//  Created by Maysa on 08/08/21.
//
//{
//  "historyID": "9a157e36-7279-41d0-9d30-5310e9afd6321",
//  "date": "2020-11-24T00:00:00.000",
//  "name": "Bar da Mooca",
//  "price": 250.10,
//  "iconImage": "url-image-mooca"
//}
import Foundation


class historico {
    
    var historyID: String?
    var date: String?
    var name:String?
    var price: Double?
    var iconImage: String?
    
    init(dicionario:[String:Any]) {
        
        self.historyID = dicionario["historyID"] as? String
        self.date = dicionario["date"] as? String
        self.name = dicionario["name"] as? String
        self.price = dicionario["price"] as? Double
        self.iconImage = dicionario["iconImage"] as? String
    }
}
