import UIKit

class SecondaryViewController: UIViewController {
    
    class func instantiate() -> SecondaryViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("SecondaryViewController") as! SecondaryViewController
    }
    
    var interactor: ConnectivityInteractor?
    @IBOutlet weak var popupView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10
        popupView.layer.borderColor = UIColor.blackColor().CGColor
        popupView.layer.borderWidth = 0.25
        popupView.layer.shadowColor = UIColor.blackColor().CGColor
        popupView.layer.shadowOpacity = 0.6
        popupView.layer.shadowRadius = 15
        popupView.layer.shadowOffset = CGSize(width: 5, height: 5)
        popupView.layer.masksToBounds = false
    }
    
    @IBAction func didTapIAgree(sender: AnyObject) {
        self.interactor?.hideDownloadsRestrictedWarningUntilColdStart()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didTapDone(sender: AnyObject) {

    }
}
