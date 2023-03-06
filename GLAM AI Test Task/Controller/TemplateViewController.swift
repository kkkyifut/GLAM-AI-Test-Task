import UIKit

final class TemplateViewController: UIViewController {
    private let musicPlayer = MusicPlayer.shared
    private var timer: Timer?
    private var timeNeeded: Float = 10
    private var timeLeft: Float = 10
    private var timeInterval: TimeInterval = 0.05
    
    @IBOutlet weak private var originalImage: UIImageView!
    @IBOutlet weak private var cutTransImage: UIImageView!
    @IBOutlet private var progressBar: UIProgressView!
    
    @IBAction private func backButton(_ sender: UIButton) {
        musicPlayer.stopTemplateMusic()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTemplateAnimations()
        startTimerProgress()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func createTemplateAnimations() {
        firstImageAnimation()
        secondImageAnimation()
        thirdImageAnimation()
        fourthImageAnimation()
        fifthImageAnimation()
        sixthImageAnimation()
        seventhImageAnimation()
    }
    
    private func firstImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-8-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-8-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            cutTransImage.layer.anchorPoint = CGPoint(x: 1.0, y: 1.0)
            cutTransImage.frame.origin.x += cutTransImage.frame.size.width / 2
            cutTransImage.frame.origin.y += cutTransImage.frame.size.height / 2
            cutTransImage.image = newImageTrans.image
            cutTransImage.transform = CGAffineTransform(rotationAngle: 0.15)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            originalImage.image = newImageTransBack.image
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) { [self] in
            originalImage.image = newImageTransBack.image
            cutTransImage.transform = .identity
        }
    }
    
    private func secondImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-7-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-7-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) { [self] in
            newImageTrans.frame = originalImage.frame
            cutTransImage.addSubview(newImageTrans)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) { [self] in
            newImageTrans.removeFromSuperview()
            cutTransImage.image = newImageTrans.image
            originalImage.image = newImageTransBack.image
        }
    }
    
    private func thirdImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-6-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-6-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) { [self] in
            newImageTrans.frame = originalImage.frame
            cutTransImage.addSubview(newImageTrans)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) { [self] in
            newImageTrans.removeFromSuperview()
            cutTransImage.image = newImageTrans.image
            originalImage.image = newImageTransBack.image
        }
    }
    
    private func fourthImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-4-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-4-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.1) { [self] in
            newImageTransBack.frame = originalImage.frame
            originalImage.addSubview(newImageTransBack)
            newImageTransBack.transform = CGAffineTransform(scaleX: 1.2, y: 1.2).rotated(by: 0.2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                newImageTransBack.transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: 0.2)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.cutTransImage.image = newImageTrans.image
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [self] in
                    newImageTransBack.removeFromSuperview()
                    originalImage.image = newImageTransBack.image
                }
            }
        }
    }
    
    private func fifthImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-2-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-2-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.4) { [self] in
            newImageTrans.frame = originalImage.frame
            cutTransImage.addSubview(newImageTrans)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                newImageTrans.removeFromSuperview()
                self.originalImage.image = newImageTransBack.image
                self.cutTransImage.image = newImageTrans.image
            }
        }
    }
    
    private func sixthImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-3-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-3-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.2) { [self] in
            newImageTrans.frame = originalImage.frame
            newImageTrans.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            cutTransImage.addSubview(newImageTrans)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.originalImage.image = newImageTransBack.image
                self.cutTransImage.image = newImageTrans.image
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    newImageTrans.removeFromSuperview()
                }
            }
        }
    }
    
    private func seventhImageAnimation() {
        let newImageTransBack = UIImageView(image: UIImage(named: "image-1-resultTransBack"))
        let newImageTrans = UIImageView(image: UIImage(named: "image-1-resultTrans"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.3) { [self] in
            newImageTransBack.frame = originalImage.frame
            newImageTransBack.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            cutTransImage.addSubview(newImageTransBack)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                newImageTransBack.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    newImageTransBack.transform = CGAffineTransform(scaleX: 1.17, y: 1.17)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        newImageTransBack.transform = CGAffineTransform(scaleX: 1, y: 1)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            newImageTransBack.removeFromSuperview()
                            self.originalImage.image = newImageTransBack.image
                            self.cutTransImage.image = newImageTrans.image
                        }
                    }
                }
            }
        }
    }
    
    private func startTimerProgress() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(onTimeFires), userInfo: nil, repeats: true)
        timer?.tolerance = timeInterval
    }
    
    private func stopTimerProgress() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func onTimeFires() {
        updateProgressBar()
        timeLeft -= Float(timeInterval)
        
        if timeLeft <= 0 {
            stopTimerProgress()
            timeLeft = timeNeeded
        }
    }
    
    private func updateProgressBar() {
        progressBar.progress = (timeNeeded - timeLeft) / timeNeeded
    }
}
