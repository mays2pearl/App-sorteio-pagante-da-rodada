//
//  HistoricoController.swift
//  iPayBF
//
//  Created by Maysa on 08/08/21.
//

import Foundation

class HistoricoList{
    
    private var arrayHistorico : [historico] = []
    
    var count: Int {
        
        return self.arrayHistorico.count
    }
    func loadCurrentHistorico(indexPath: IndexPath) -> historico{
        
        return self.arrayHistorico[indexPath.row]
        
    }
    func carregaDados (completionHandler: (_ result: Bool, _ error: Error?)-> Void){
        
        if let path = Bundle.main.path(forResource: "Historico", ofType: "json"){
            
            
            do{
        
                let data = try Data (contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let _jsonResult = jsonResult as? Dictionary<String, Any> , let Historico = _jsonResult ["historyAccountList"] as? [[String: Any]] {
                    
                    for value in Historico{
                        
                        self.arrayHistorico.append(historico.init(dicionario: value))
                    }
                    print(arrayHistorico)
                    completionHandler(true, nil)
                }
            
            }catch{
                
            }
        }
        
    }
    
    
}
