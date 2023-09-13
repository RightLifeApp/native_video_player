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

//        playerLayer.videoGravity = .resize
        addSubview(playerContoller.view)
    }

    deinit {
        playerContoller.view.removeFromSuperview()
//        removeSubview(playerContoller.view)
//        playerLayer.removeFromSuperlayer()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerContoller.view.frame = bounds
//        playerLayer.removeAllAnimations()
    }
}

