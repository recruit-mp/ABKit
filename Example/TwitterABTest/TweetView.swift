import UIKit
import SDWebImage
import DOFavoriteButton
import ABKit

class TweetView: UITableViewCell {
    
    @IBOutlet weak var pict: UIImageView! {
        didSet {
            pict.layer.cornerRadius = 4
        }
    }
    
    @IBOutlet weak var favBtn: DOFavoriteButton! {
        didSet {
            favBtn.setTitle("", forState: .Selected)
            
            let defaultVersion = Version(name: "star") { print("Pattern A") }
            let test = SplitTest(defaultVersion: defaultVersion)
            
            let b = Version(name: "heart") { print("Pattern B") }
            test.addVersion(b, weight: 0.5)
            
            test.run() // A(Default Version) = 50%, B = 50%
            
            favBtn.image = UIImage(named: "heart")
            favBtn.imageColorOn = UIColor.redColor()
            favBtn.circleColor = UIColor.redColor()
            favBtn.lineColor = UIColor.redColor()
            
            favBtn.addTarget(self, action: Selector("tapped:"), forControlEvents: .TouchUpInside)
        }
    }
    
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var body: UILabel!
    
    var tweet: Tweet? {
        didSet {
            let url = NSURL(string: (tweet?.picture)!)
            pict.sd_setImageWithURL(url!)
            user_name.text = tweet?.user_name
            body.text = tweet?.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
    }
    
    func tapped(sender: DOFavoriteButton) {
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
}