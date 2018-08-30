//
//  RegisterController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/29/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit
import SQLite3

class RegisterController: UIViewController {

    @IBOutlet weak var userReg: UITextField!
    @IBOutlet weak var passwordReg: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Coba.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            print("Connected")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Login (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        let username = userReg.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordReg.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var stmt: OpaquePointer?
        
        let query = "INSERT INTO Login (username, password) VALUES (?,?)"
        
        if sqlite3_prepare(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        if sqlite3_bind_text(stmt, 1, username, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        if sqlite3_bind_text(stmt, 2, password, -1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error: \(errmsg)")
        }
        
        userReg.text = ""
        passwordReg.text = ""
        
        print("Sukses!")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
