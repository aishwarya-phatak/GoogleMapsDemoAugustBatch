//
//  ThirdViewController1.swift
//  Demo1
//
//  Created by Vishal Jagtap on 03/10/22.
//

import UIKit

class ThirdViewController1: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        downloadJSONData {
            self.tableView.reloadData()
        }
    }
    
    //closure types
    //trailing closure , escaping closure
    func downloadJSONData(completed : @escaping() -> ()){
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)!
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            if(error == nil){
                do{
                    let jsonDecoder = JSONDecoder()
                    self.posts = try jsonDecoder.decode([Post].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }catch{
                    print("Error")
                }
            }
        }.resume()
    }
}

extension ThirdViewController1 : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = String(posts[indexPath.row].id)
        return cell
    }
}

extension ThirdViewController1 : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
