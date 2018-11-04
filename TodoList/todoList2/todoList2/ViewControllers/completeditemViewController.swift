import UIKit

class completedItemViewController: UIViewController {
    
    @IBOutlet weak var itemDescription: UILabel!
    
    var completedTextDescription: String = "Error: Seque Didn't Work"
    
    override func viewWillAppear(_ animated: Bool) {
        itemDescription.text = completedTextDescription
    }
    
    
}
