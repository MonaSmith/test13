//
//  ViewController.swift
//  实验十三(1)
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018年 wanfengling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            print("Timer Thread:\(Thread.current)")
            self.countLabel.text = "\(self.count)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            print("Sum Thread:\(Thread.current)")
            for i in 1...9999999{
                sum += i
                
            }
            DispatchQueue.main.async {
                self.sumLabel.text = "\(sum)"
            }
            
        }
    }
    
}

