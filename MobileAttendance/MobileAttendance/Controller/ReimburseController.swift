//
//  ReimburseController.swift
//  MobileAttendance
//
//  Created by MacOs on 8/27/18.
//  Copyright © 2018 Tafta. All rights reserved.
//

import UIKit

class ReimburseController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    

    @IBOutlet weak var jumlahTextField: UITextField!
    @IBOutlet weak var kategoriPicker: UIPickerView!
    @IBOutlet weak var tagPicker: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var kategoriValue = ""
    var tagValue = ""
    var tanggalValue = ""
    
    
    
    let kategoriData = ["Transportasi", "Konsumsi", "Telekmunikasi", "Operasional"]
    let tagData = ["Dinas", "Meeting", "Daily"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == kategoriPicker {
            return kategoriData.count
        } else {
            return tagData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == kategoriPicker {
            return kategoriData[row]
        } else {
            return tagData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == kategoriPicker {
            kategoriValue = kategoriData[row]
        } else {
            tagValue = tagData[row]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kategoriPicker.delegate = self
        kategoriPicker.dataSource = self
        
        tagPicker.delegate = self
        tagPicker.dataSource = self
        
        jumlahTextField.keyboardType = .numberPad

        // Do any additional setup after loading the view.
    }
        

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendFormData" {
            
            let secondVC = segue.destination as! DataController
            
            secondVC.jumlah = jumlahTextField.text!
            secondVC.kategori = kategoriValue
            secondVC.tag = tagValue
            secondVC.tanggal = tanggalValue
        }
    }
    
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy"
        let strDate = dateFormatter.string(from: sender.date)
        tanggalValue = strDate
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "sendFormData", sender: self)
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
