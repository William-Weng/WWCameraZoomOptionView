//
//  WWCameraZoomOptionViewDelegate.swift
//  WWCameraZoomOption
//
//  Created by William.Weng on 2025/1/22.
//

import Foundation

// MARK: - WWCameraZoomOptionViewDelegate
public protocol WWCameraZoomOptionViewDelegate: AnyObject {
    
    /// 項目數量
    /// - Parameter optionView: WWCameraZoomOptionView
    /// - Returns: Int
    func itemCount(with optionView: WWCameraZoomOptionView) -> Int
    
    /// 項目文字
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    /// - Returns: String
    func labelText(with optionView: WWCameraZoomOptionView, index: Int) -> String
    
    /// 動畫時間
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: index
    /// - Returns: TimeInterval
    func duration(with optionView: WWCameraZoomOptionView, index: Int) -> TimeInterval
    
    /// 項目被選到哪一個
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, didSelected index: Int)
    
    /// 項目點擊能不能有反應
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    /// - Returns: Bool
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, canTapWith index: Int) -> Bool
    
    /// 項目縮放比例
    /// - Parameters:
    ///   - optionView: WWCameraZoomOptionView
    ///   - index: Int
    /// - Returns: CGFloat
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, scaleWith index: Int) -> CGFloat
}
