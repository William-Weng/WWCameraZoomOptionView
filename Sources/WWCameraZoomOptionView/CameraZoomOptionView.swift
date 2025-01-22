//
//  CameraZoomOption.swift
//  WWCameraZoomOption
//
//  Created by William.Weng on 2025/1/22.
//

import UIKit

// MARK: - 縮放圓點顯示外型
class CameraZoomOptionView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initSetting()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetting()
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        cornerRadiusSetting(optionImageView.frame.width * 0.5)
    }
}

// MARK: - 公開工具
extension CameraZoomOptionView {
    
    /// 相關外型設定
    /// - Parameters:
    ///   - tag: UInt
    ///   - optionViewInformation: WWCameraZoomOptionView.OptionViewInformation
    func setting(with tag: UInt, text: String?, optionViewInformation: WWCameraZoomOptionView.OptionViewInformation) {
        
        self.tag = Int(tag)
        
        optionLabel.text = text
        optionLabel.font = optionViewInformation.font
        optionLabel.textColor = optionViewInformation.textColor
    }
    
    /// 更新縮放比例 + 動畫
    /// - Parameters:
    ///   - scale: 縮放比例
    ///   - duration: 動畫時間
    func updateGapTransform(with scale: CGFloat, duration: TimeInterval) {
        
        UIViewPropertyAnimator(duration: duration, curve: .easeInOut) { [unowned self] in
            updateGapTransform(scale)
            optionImageView.setNeedsLayout()
            optionImageView.layoutIfNeeded()
        }.startAnimation()
    }
    
    /// 更新縮放比例
    /// - Parameters:
    ///   - scale: 縮放比例
    func updateGapTransform(_ scale: CGFloat) {
        contentView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}

// MARK: - 小工具
private extension CameraZoomOptionView {
    
    /// 初始化設定
    func initSetting() {
        initViewFromXib()
        optionImageView.clipsToBounds = true
    }
    
    /// 讀取Nib畫面 => 加到View上面
    func initViewFromXib() {
        
        let bundle = Bundle.module
        let name = String(describing: CameraZoomOptionView.self)
        
        bundle.loadNibNamed(name, owner: self, options: nil)
        contentView.frame = bounds
        
        addSubview(contentView)
    }
    
    /// 圓角設定
    /// - Parameter cornerRadius: CGFloat
    func cornerRadiusSetting(_ cornerRadius: CGFloat) {
        optionImageView.layer.cornerRadius = cornerRadius
    }
}
