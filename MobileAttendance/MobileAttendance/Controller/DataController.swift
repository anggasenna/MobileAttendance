//
//  DataController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/28/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit

class DataController: UIViewController {

    @IBOutlet weak var tanggalLabel: UILabel!
    @IBOutlet weak var jumlahLabel: UILabel!
    @IBOutlet weak var kategoriLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    var tanggal = ""
    var jumlah = ""
    var kategori = ""
    var tag = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tanggalLabel.text = tanggal
        jumlahLabel.text = jumlah
        kategoriLabel.text = kategori
        tagLabel.text = tag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
