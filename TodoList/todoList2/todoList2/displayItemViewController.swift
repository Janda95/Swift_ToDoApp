import UIKit

class DisplayItemViewController: UIViewController {
    
    @IBOutlet weak var ItemDescription: UILabel!
    
    var textDescription = ""
    
    override func viewWillAppear(_ animated: Bool) {
        ItemDescription.text = textDescription
    }
    
}
