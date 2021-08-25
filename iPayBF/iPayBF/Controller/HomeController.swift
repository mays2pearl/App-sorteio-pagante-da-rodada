//
//  HomeController.swift
//  iPayBF
//
//  Created by Maysa on 05/08/21.
//

import Foundation


protocol HomeControllerProtocol: AnyObject {
    
    func showSortedUser()
    func removeNotSortedUser(indexPath: IndexPath)
}

class HomeController {
    
    
    private var arrayNameImage:[String] = ["Image-1","Image-2","Image-3","Image-4","Image-5"]
    private var arrayUser:[User] = []
    private var sortedUser:User?
    
    var delegate: HomeControllerProtocol?
    
    func addUser(name: String?) {
        
        self.arrayUser.append(User(name: name ?? "", imageName: self.arrayNameImage.randomElement() ?? ""))
    }
    
    func checkEmptyState() -> Bool {
        
        if self.arrayUser.count > 0 {
            return false
        }
        
        return true
    }
    
    func count() -> Int {
        
        if self.arrayUser.count == 0 {
            
            return 1
        }
        
        return self.arrayUser.count
    }
    
    func loadCurrentUser(indexPath: IndexPath) -> User {
        
        return self.arrayUser[indexPath.row]
    }
    
    func blockSortButton() -> Bool {
        
        if self.arrayUser.count > 1 {

            return false
        }
        
        return true
        
//        return self.arrayUser.count > 1
    }
    
    func sortUser() {
        
        self.sortedUser = self.arrayUser.randomElement()
    }
    
    func checkUserSorted(indexPath: IndexPath) {
        
        if self.sortedUser === self.arrayUser[indexPath.row] {
            
            self.delegate?.showSortedUser()
            
        }else {
            self.arrayUser.remove(at: indexPath.row)
            
            self.delegate?.removeNotSortedUser(indexPath: indexPath)
        }
    }
}
