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
    private let defaultDuration: TimeInterval = 0.25
    
    private weak var delegate: WWCameraZoomOptionViewDelegate?
    
    private var optionViewInformation: OptionViewInformation = (font: UIFont.systemFont(ofSize: 12), textColor: .white, backgroundColor: .darkGray.withAlphaComponent(0.5))
    
    deinit {
        delegate = nil
    }
}

// MARK: - @objc
@objc extension WWCameraZoomOptionView {
    
    /// 選項被點到的處理
    /// - Parameter tap: UITapGestureRecognizer
    func haneleTapAction(_ tap: UITapGestureRecognizer) {
        
        guard let optionView = tap.view as? CameraZoomOptionView else { return }
        selectItem(with: optionView.tag)
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
    func selectItem(with index: Int, scale: CGFloat = 1.2) {
        
        let count = optionStackView.subviews.count
        
        optionStackView.arrangedSubviews.forEach { subView in
            
            guard let subView = subView as? CameraZoomOptionView else { return }
            
            let _scale = (subView.tag != index) ? 1.0 : scale
            subView.updateGapTransform(with: _scale, duration: durationMaker(with: index))
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
            let tap = UITapGestureRecognizer(target: self, action: #selector(haneleTapAction))
            
            optionView.setting(with: index, text: text, optionViewInformation: optionViewInformation)
            optionView.addGestureRecognizer(tap)
            optionStackView.addArrangedSubview(optionView)
        }
        
        optionStackView.axis = .horizontal
        optionStackView.distribution = .fillEqually
        
        optionStackView._autolayout(on: self)
    }
    
    /// 取得動畫時間
    /// - Parameters:
    ///   - index: 序號
    /// - Returns: TimeInterval
    func durationMaker(with index: Int) -> TimeInterval {
        return delegate?.duration(with: self, index: index) ?? defaultDuration
    }
}
