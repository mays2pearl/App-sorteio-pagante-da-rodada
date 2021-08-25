//
//  AccountController.swift
//  iPayBF
//
//  Created by Maysa on 09/08/21.
//

import Foundation


class AccountList{
    
    private var arrayAccount : [account] = []
    
    var count: Int {
        
        return self.arrayAccount.count
    }
    func loadCurrentAccount(indexPath: IndexPath) -> account{
        
        return self.arrayAccount[indexPath.row]
        
    }
    func carregaDados (completionHandler: (_ result: Bool, _ error: Error?)-> Void){
        
        if let path = Bundle.main.path(forResource: "Account", ofType: "json"){
            
            
            do{
        
                let data = try Data (contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let _jsonResult = jsonResult as? Dictionary<String, Any> , let Account = _jsonResult ["productList"] as? [[String: Any]] {
                    
                    for value in Account{
                        
                        self.arrayAccount.append(account.init(dicionario: value))
                    }
                    print(arrayAccount)
                    completionHandler(true, nil)
                }
            
            }catch{
                
            }
        }
        
    }
    
    
}
