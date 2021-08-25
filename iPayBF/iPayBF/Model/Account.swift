//
//  AccountVC.swift
//  iPayBF
//
//  Created by Maysa on 09/08/21.
//
//{
//  "productID": "9a157e36-7279-41d0-9d30-5310e9afd6324",
//  "productType": "REFEIÇÃO",
//  "date": "2020-11-24T00:00:00.000",
//  "name": "Fritas",
//  "price": 45.7,
//  "quantity": 2
//}
import Foundation

class account{
    
    var productID: String?
    var productType: String?
    var date: String?
    var name: String?
    var price: Double?
    var quantity: Int?
    
    init(dicionario:[String:Any]) {
        
        self.productID = dicionario["productID"] as? String
        self.productType = dicionario["productType"] as? String
        self.date = dicionario["date"] as? String
        self.name = dicionario["name"] as? String
        self.price = dicionario["price"] as? Double
        self.quantity = dicionario["quantity"] as? Int
        
        
    }
}
