//
//  ViewController.swift
//  StudentKit
//
//  Created by yunjikim on 2023/06/14.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var labelStudents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var studentsText: String = ""
        
//        for student in students {
//            studentsText = studentsText + "\(student)\n"
//        }
        
        labelStudents.text = studentsText
    }


}

