//
//  ViewController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/26/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit
import SQLite3

class LoginController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let defaults = UserDefaults.standard
    var db: OpaquePointer?
    var loginList = [Login]()
    
    var usernameDefault = ""
    var passwordDefault = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Coba.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            print("Connected")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginCheck(username: String, password: String) -> Bool {
        
        loginList.removeAll()
        
        let query = "SELECT * FROM Login WHERE username='\(username)' AND password='\(password)'"
        
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            let id = sqlite3_column_int(stmt, 0)
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            
            loginList.append(Login(id: Int(id), username: username, password: password))
        }
        
        if loginList.isEmpty {
            return false
        } else {
            return true
        }
        
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let usernameInput = userField.text!
        let passwordInput = passwordField.text!
        
        if self.loginCheck(username: usernameInput, password: passwordInput) == true {
            
//            let alert = UIAlertController(title: "Sukses", message: "Welcome!", preferredStyle: .alert)
            
//            let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
//            alert.addAction(OkAction)
            
            defaults.set(usernameInput, forKey: "username")
            defaults.set(passwordInput, forKey: "password")
            
            performSegue(withIdentifier: "goToHome", sender: self)
            
        } else {
            
            let alert = UIAlertController(title: "Gagal", message: "Salah!", preferredStyle: .alert)
            
            let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(OkAction)
            
            present(alert, animated: true, completion:  nil)
            
        }
        
    }
    
}

