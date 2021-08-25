//
//  ViewController.swift
//  iPayBF
//
//  Created by Maysa on 05/08/21.
//

import UIKit

import  PopupDialog

class HomeVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var usersTableView: UITableView!
    
    private var alert: Alert?
    private var controller: HomeController = HomeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        self.usersTableView.tableFooterView = UIView()
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
        self.blockSortButton()
        self.nameTextField.delegate = self
        self.controller.delegate = self
        self.alert = Alert(viewController: self)
        
        
        // Do any additional setup after loading the view.
    }
    
    private func blockSortButton() {
        
        if self.controller.blockSortButton() {
            self.sortButton.isUserInteractionEnabled = false
            self.sortButton.alpha = 0.5
            
        }else {
            
            self.sortButton.isUserInteractionEnabled = true
            self.sortButton.alpha = 1.0
        }
    }
    
    @IBAction func tappedSortButton(_ sender: UIButton) {
        
        self.nameTextField.resignFirstResponder()
        self.controller.sortUser()
        
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if controller.checkEmptyState() {
            
            let cell: EmptyCell? = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell
            
            return cell ?? UITableViewCell()
            
        }else {
            
            let cell: UserCell? = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
            
            cell?.setup(value: self.controller.loadCurrentUser(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.controller.checkUserSorted(indexPath: indexPath)
    }
    
}

extension HomeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.controller.addUser(name: textField.text)
        textField.text = nil
        self.usersTableView.reloadData()
        self.blockSortButton()
        
        return true
        
    }
}

extension HomeVC: HomeControllerProtocol {
    
    func removeNotSortedUser(indexPath: IndexPath) {
        
        self.usersTableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func showSortedUser() {
        
        self.alert?.detailAlert(titulo: "Deu Ruim", mensagem: " Vc vai pagar a conta sozinho !!!!", completion: { success in
            
            self.performSegue(withIdentifier: "AccountVC", sender: Any?(nilLiteral: ()))
            print("clicou no ok do botao alert")
        })

        print("vc se lascou... vai pagar a conta")
    }
    
    
}



