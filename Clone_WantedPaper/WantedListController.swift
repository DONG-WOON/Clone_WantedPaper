//
//  Clone_WantedPaper
//
//  Created by 서동운 on 2021/05/13.
//

import UIKit

struct bountyInfo {
    let name: String
    let bounty: Int

    var img: UIImage? {
        return UIImage(named: "\(name).jpg")
    }

    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}

class ListCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var value: UILabel!
    
    func update(info: bountyInfo) {
        img.image = info.img
        name.text = info.name
        value.text = "\(info.bounty)"
    }
}

class BountyViewModel {
    
    let bountyInfoList: [bountyInfo] = [
        bountyInfo(name: "sanji", bounty: 100000),
        bountyInfo(name: "zoro", bounty: 200000),
        bountyInfo(name: "luffy", bounty: 300000),
        bountyInfo(name: "nami", bounty: 50000),
        bountyInfo(name: "franky", bounty: 120000)
    ]
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    func BountyInfo(at index: Int) -> bountyInfo {
        return bountyInfoList[index]
    }
}

class WantedListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let ViewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                
                let bountyInfo = ViewModel.BountyInfo(at: index)
                vc?.ViewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.numOfBountyInfoList
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let bountyInfo = ViewModel.BountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue_detail", sender: indexPath.row)
    }
}
