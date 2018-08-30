//
//  HomeController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/26/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var absenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sideBarButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        
        performSegue(withIdentifier: "logoutSegue", sender: self)
     
        
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
