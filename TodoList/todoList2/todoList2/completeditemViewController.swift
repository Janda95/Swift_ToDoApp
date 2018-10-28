import UIKit

class completedItemViewController: UIViewController {
    
    @IBOutlet weak var itemDescription: UILabel!
    
    var completedTextDescription: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        itemDescription.text = completedTextDescription
    }
    
    
}
