//
//  ViewController.swift
//  Demo1
//
//  Created by Vishal Jagtap on 12/09/22.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var snacksTableView: UITableView!
    var snacks : [String] = ["Poha","Upma","Dosa","Pavbhaji","Dhokla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snacksTableView.dataSource = self
        snacksTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.snacksTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "bitcode"
        
        return cell ?? UITableViewCell()
    }
}
