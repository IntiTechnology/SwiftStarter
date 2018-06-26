//
//  ViewController.swift
//  SwiftStarter
//
//  Created by Erick Manrique on 5/18/18.
//  Copyright © 2018 Erick Manrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    deinit {
        print("deinit")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
        let viewController = FirstViewController()
//        self.present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
}

