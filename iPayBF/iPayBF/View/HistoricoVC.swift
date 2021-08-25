//
//  HistoricoVC.swift
//  iPayBF
//
//  Created by Maysa on 08/08/21.
//

import UIKit

class HistoricoVC: UIViewController {

    
    @IBOutlet weak var historicoTableView: UITableView!
    
    private var controller: HistoricoList = HistoricoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.historicoTableView.delegate = self
        self.historicoTableView.dataSource = self
        self.historicoTableView.tableFooterView = UIView()
        
        self.historicoTableView.register(UINib(nibName: "historicoCell", bundle: nil), forCellReuseIdentifier: "historicoCell")
        
        self.controller.carregaDados { success, error in
            
            if success {
                self.historicoTableView.reloadData()
            }else{
                
                print(error)
            }
        }
       
    }


}

extension HistoricoVC: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: historicoCell? = tableView.dequeueReusableCell(withIdentifier: "historicoCell", for: indexPath) as? historicoCell
        
        cell?.setup(value: self.controller.loadCurrentHistorico(indexPath: indexPath))
        
        
        
        return cell ?? UITableViewCell ()
    }
}
