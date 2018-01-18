//
//  ViewController.swift
//  TestApiCall
//
//  Created by Heady on 17/01/18.
//  Copyright © 2018 Heady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAlamofire(_ sender: Any) {
        Network.getIPAddress(from: Constants.ApiName.getIP, url: Constants.EndPoint.debugURL, completion: { (address) in
            self.updateUI(address: address)
        }) { (code, error) in
            self.updateErrorUI(error: error)
        }
    }
    @IBAction func buttonAction(_ sender: Any) {
        Network.getIPAddressFromAlamofire(from:Constants.ApiName.getIP, url:Constants.EndPoint.debugURL , completion: { (address) in
            self.updateUI(address: address)
        }) { (coode, error) in
            self.updateErrorUI(error: error)
        }
    }
    
    func updateUI(address:Address) {
        DispatchQueue.main.async(execute: { () -> Void in
            self.labelText.text = address.ip
        })
    }
    func updateErrorUI(error:Error) {
        DispatchQueue.main.async(execute: { () -> Void in
            self.labelText.text = error.localizedDescription
        })
    }

}

