import UIKit

class PrimaryViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Usage example
        let interactor = ConnectivityInteractor()
        if (interactor.shouldAllowLargeDownloads()) {
            // Just do whatever you were about to do
        } else {
            //Show warning
            let secondaryVC = SecondaryViewController.instantiate()
            secondaryVC.interactor = interactor
            self.presentViewController(secondaryVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func showModalVC(sender: AnyObject) {
    }
}
