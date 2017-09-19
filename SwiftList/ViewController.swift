//
//  ViewController.swift
//  SwiftList
//
//  Created by Thej on 9/18/17.
//  Copyright © 2017 Thej. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    
    var tasks = ["Thej", "Tanvi", "Havi", "Juan", "Harshada", "Grant"]
    var ages = [Int]()

    @IBOutlet weak var enterStuffTextField: UITextField!
    @IBOutlet weak var SwiftTableView: UITableView!
    @IBAction func beastButton(_ sender: UIButton) {
        
        if (enterStuffTextField.text != "") {
           let text = enterStuffTextField.text
        print (text ?? "no text")
            tasks.append(text!)
        print(tasks)
        }
        randomGen()
        SwiftTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        tasks.remove(at: indexPath.row)
        SwiftTableView.reloadData()
    }
    
    
    func randomGen() {
        for _ in 0...tasks.count {
            let temp = Int(arc4random_uniform(100))
            ages.append(temp)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomGen()
        SwiftTableView.dataSource = self
        SwiftTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProtoCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.detailTextLabel?.text = String(ages[indexPath.row]) + " Years Old"
        return cell
    }
}
