//
//  WWCameraZoomOption.swift
//  WWCameraZoomOption
//
//  Created by William.Weng on 2025/1/22.
//

import UIKit

// MARK: - 縮放圓點的顯示外型
open class WWCameraZoomOptionView: UIView {
            
    private let optionStackView = UIStackView()
    
    private weak var delegate: WWCameraZoomOptionViewDelegate?
    
    private var optionViewInformation: OptionViewInformation = (font: UIFont.systemFont(ofSize: 12), textColor: .white, backgroundColor: .darkGray.withAlphaComponent(0.5))
    
    deinit {
        delegate = nil
    }
}

// MARK: - 公開函式
public extension WWCameraZoomOptionView {
    
    /// 相關設定
    /// - Parameters:
    ///   - delegate: WWCameraZoomOptionViewDelegate
    ///   - optionViewInformation: OptionViewInformation?
    func configure(with delegate: WWCameraZoomOptionViewDelegate?, optionViewInformation: OptionViewInformation? = nil) {
        
        if let optionViewInformation = optionViewInformation { self.optionViewInformation = optionViewInformation }
        
        let count = delegate?.itemCount(with: self) ?? 0
        self.delegate = delegate
        
        createStackView(with: UInt(count), optionViewInformation: self.optionViewInformation)
    }
    
    /// 選擇選項
    /// - Parameters:
    ///   - index: 序號
    ///   - scale: 縮放比例
    ///   - duration: 動畫時間
    func selectItem(with index: Int, scale: CGFloat = 1.2, duration: TimeInterval = 0.25) {
        
        let count = optionStackView.subviews.count
        
        optionStackView.arrangedSubviews.forEach { subView in
            
            guard let subView = subView as? CameraZoomOptionView else { return }
            
            let _scale = (subView.tag != index) ? 1.0 : scale
            subView.updateGapTransform(with: _scale, duration: duration)
        }
        
        if count != 0, count > index {
            delegate?.cameraZoomOptionView(self, didSelected: index)
        }
    }
}

// MARK: - 小工具
private extension WWCameraZoomOptionView {
    
    /// 建立選項外型
    /// - Parameters:
    ///   - labelTexts: [String]
    ///   - spacing: CGFloat
    ///   - font: UIFont
    func createStackView(with count: UInt, optionViewInformation: OptionViewInformation) {
        
        optionStackView._removeAllArrangedSubviews()
        
        (0..<count).forEach { index in
            
            let optionView = CameraZoomOptionView()
            let text = delegate?.labelText(with: self, index: Int(index))
            
            optionView.setting(with: index, text: text, optionViewInformation: optionViewInformation)
            optionStackView.addArrangedSubview(optionView)
        }
        
        optionStackView.axis = .horizontal
        optionStackView.distribution = .fillEqually
        
        optionStackView._autolayout(on: self)
    }
}
