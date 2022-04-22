//
//  ViewController.swift
//  Bookworm
//
//  Created by Matthew Ochoa on 4/21/22.
//

// API Keys: AIzaSyBrGYvOussvVNyIeQppoZx3FjE7_GJxnho
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var bookList = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.itbook.store/1.0/search/mongodb")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 self.bookList = dataDictionary["books"] as! [[String:Any]]
                 self.tableView.reloadData()
                 print(dataDictionary)
                 

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        
         
    
        let booklist = bookList[indexPath.row]
        let title = booklist["title"] as! String
        let pricing = booklist["price"] as! String
        let bookDesc = booklist["subtitle"] as! String
        let bookImageURL = URL(string: booklist["image"] as! String)
        
        
        cell.bookTitle!.text = title
        cell.bookDescription!.text = bookDesc
        cell.bookPrice!.text = pricing
        
        cell.bookCover.af.setImage(withURL: bookImageURL!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let book = bookList[indexPath.row]
        
        let detailsViewController = segue.destination as! BookDescription
        detailsViewController.Book = book //The Lowercase book is referring to line 79.
        //Uppercase Book is referring to the Array I created in the start.
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}

