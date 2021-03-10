//
//  WelcomeViewController.swift
//  FirebaseUsers
//
//  Created by Germán Santos Jaimes on 10/03/21.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet var userLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUser()
      
    }
    
    @IBAction func closeSession(_ sender: UIButton){
        do{
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }catch let error{
            showMessage(title: "Error", message: "Error al cerrar la sesión \(error.localizedDescription)")
        }
    }
    
    func showUser(){
        let user = Auth.auth().currentUser?.email
        userLB.text = user
    }
    
    // MARK:- Auxiliar functions
    func showMessage(title: String, message: String){
        
        var alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    
    

}
