import UIKit

class DisplayItemViewController: UIViewController {
    
    @IBOutlet weak var ItemDescription: UILabel!
    
    var textDescription: String = "Error: Seque Didn't Work"
    
    override func viewWillAppear(_ animated: Bool) {
        ItemDescription.text = textDescription
    }
    
}
