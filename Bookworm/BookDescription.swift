//
//  BookDescription.swift
//  Bookworm
//
//  Created by Matthew Ochoa on 4/22/22.
//

import UIKit
import AlamofireImage

class BookDescription: UIViewController {
    
    
    var Book: [String:Any]!
    
    @IBOutlet weak var bookdescCover: UIImageView!
    
    @IBOutlet weak var bookPricing: UILabel!
    
    @IBOutlet weak var bookdescTitle: UILabel!
    
    @IBOutlet weak var bookDesc: UILabel!
    
    @IBOutlet weak var bookISBN: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let bookImageURL = URL(string: Book["image"] as! String)
        
        bookdescTitle.text = Book["title"] as? String
        bookDesc.text = Book["subtitle"] as? String
        bookPricing.text = Book["price"] as? String
        bookISBN.text = Book["isbn13"] as? String
        
        bookdescCover.af.setImage(withURL: bookImageURL!)
        

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        
        if let url = URL(string: Book["url"] as! String) {
             UIApplication.shared.open(url, options: [:])
         }
        
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
