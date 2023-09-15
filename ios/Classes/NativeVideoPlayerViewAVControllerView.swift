import UIKit
import AVFoundation
import AVKit

class NativeVideoPlayerViewAVControllerView: UIView {
    private let playerContoller: AVPlayerViewController

    required init?(coder: NSCoder) {
        fatalError("init(coder:) - use init(frame:) instead")
    }

    init(
        frame: CGRect,
        player: AVPlayer
    ) {
        playerContoller = AVPlayerViewController()
        playerContoller.player = player
        playerContoller.view.frame = frame
        playerContoller.showsPlaybackControls = true
        
        super.init(frame: frame)

        backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)

        addSubview(playerContoller.view)
    }

    deinit {
        playerContoller.view.removeFromSuperview()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerContoller.view.frame = bounds
    }
    
    func exitFullScreen(){
        playerContoller.exitsFullScreenWhenPlaybackEnds = true
    }
}

extension AVPlayerViewController {

    func goFullScreen() {
        let selectorName = "enterFullScreenAnimated:completionHandler:"
        let selectorToForceFullScreenMode = NSSelectorFromString(selectorName)

        if self.responds(to: selectorToForceFullScreenMode) {
            self.perform(selectorToForceFullScreenMode, with: true, with: nil)
        }
    }

    func quitFullScreen() {
        let selectorName = "exitFullScreenAnimated:completionHandler:"
        let selectorToForceQuitFullScreenMode = NSSelectorFromString(selectorName)

        if self.responds(to: selectorToForceQuitFullScreenMode) {
            self.perform(selectorToForceQuitFullScreenMode, with: true, with: nil)
        }
    }
}
