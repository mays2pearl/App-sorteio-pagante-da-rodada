//
//  ViewController.swift
//  iPayBF
//
//  Created by Maysa on 09/08/21.
//

import UIKit

class AccountVC: UIViewController {
    
    
    
    @IBOutlet weak var tableViewAccount: UITableView!
    
    private var controller: AccountList = AccountList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableViewAccount.delegate = self
        self.tableViewAccount.dataSource = self
        self.tableViewAccount.tableFooterView = UIView()
        
        self.tableViewAccount.register(UINib(nibName: "accountCell", bundle: nil), forCellReuseIdentifier: "accountCell")
        
        self.tableViewAccount.register(UINib(nibName: "totalCell", bundle: nil), forCellReuseIdentifier: "totalCell")
        
        self.controller.carregaDados { success, error in
            
            if success {
                self.tableViewAccount.reloadData()
            }else{
                
                print(error)
            }
        }
    }
    

}
extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: accountCell? = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as? accountCell
        
        cell?.setup(value: self.controller.loadCurrentAccount(indexPath: indexPath))
        
        
        
        return cell ?? UITableViewCell ()
    }
}
