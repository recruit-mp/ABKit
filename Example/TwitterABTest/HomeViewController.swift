import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension

        refreshHome()
    }
    
    func refreshHome() {
        tweets.append(Tweet(picture: "https://pbs.twimg.com/profile_images/627353777369038848/wkbYl_7i_400x400.jpg", user_name: "Yoshinori (y0sh1)", screen_name: "takesako", text: "高知県の窪川駅で魔改造気動車ゼロ系エセ新幹線ホビートレインに遭遇。シルエットがかっこいい。 ", created_at: NSDate()))
        tweets.append(Tweet(picture: "https://pbs.twimg.com/profile_images/627353777369038848/wkbYl_7i_400x400.jpg", user_name: "Yoshinori (y0sh1)", screen_name: "takesako", text: "高知高専の情報セキュリティ勉強会で上映した「バイナリかるた」のスライドPPTです。ダウンロードしてご利用ください。 ", created_at: NSDate()))
        tweets.append(Tweet(picture: "https://pbs.twimg.com/profile_images/627353777369038848/wkbYl_7i_400x400.jpg", user_name: "Yoshinori (y0sh1)", screen_name: "takesako", text: "リクルート新卒エンジニア望月さん小原さんの活動です～→IoTを駆使してトイレの個室空き状況を検知してWEBで確認できるアプリを会社で運用してみました。 ", created_at: NSDate()))
        tweets.append(Tweet(picture: "https://pbs.twimg.com/profile_images/627353777369038848/wkbYl_7i_400x400.jpg", user_name: "Yoshinori (y0sh1)", screen_name: "takesako", text: "銀座線、最強伝説、唯一平常運転", created_at: NSDate()))
        tweets.append(Tweet(picture: "https://pbs.twimg.com/profile_images/627353777369038848/wkbYl_7i_400x400.jpg", user_name: "Yoshinori (y0sh1)", screen_name: "takesako", text: "國枝先生の研究室から発掘されたパンチカード  ", created_at: NSDate()))
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tweet", forIndexPath: indexPath) as! TweetView
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}