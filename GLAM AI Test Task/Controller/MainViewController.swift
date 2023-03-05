import UIKit

final class MainViewController: UIViewController {
    private let musicPlayer = MusicPlayer.shared
    private let storyboardInstance = UIStoryboard(name: "Main", bundle: .main)

    @IBAction func toTemplateVC(_ sender: UIButton) {
        musicPlayer.startTemplateMusic()
        
        let templateVC = storyboardInstance.instantiateViewController(withIdentifier: "TemplateViewController") as! TemplateViewController
        self.navigationController?.pushViewController(templateVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

