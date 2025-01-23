//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/1/22.
//

import UIKit
import WWCameraZoomOptionView

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var zoomOptionView: WWCameraZoomOptionView!
    
    private let textArray = ["0.5x", "1.0x", "2.0x", "5.0x"]
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomOptionView.configure(with: self)
    }
    
    @IBAction func selectItem(_ sender: UIBarButtonItem) {
        zoomOptionView.selectItem(with: index)
        index += 1
    }
}

// MARK: - WWCameraZoomOptionViewDelegate
extension ViewController: WWCameraZoomOptionViewDelegate {
    
    func itemCount(with optionView: WWCameraZoomOptionView) -> Int {
        return textArray.count
    }
    
    func labelText(with optionView: WWCameraZoomOptionView, index: Int) -> String {
        return textArray[index]
    }
    
    func duration(with optionView: WWCameraZoomOptionView, index: Int) -> TimeInterval {
        return 0.25
    }
    
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, didSelected index: Int) {
        print(index)
    }
    
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, canTapWith index: Int) -> Bool {
        return true
    }
    
    func cameraZoomOptionView(_ optionView: WWCameraZoomOptionView, scaleWith index: Int) -> CGFloat {
        return 1.2
    }
}
