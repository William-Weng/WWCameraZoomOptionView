# WWCameraZoomOptionView
[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWCameraZoomOptionView) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- Option to mimic phone camera magnification.
- 模仿手機相機放大倍率的選項。

![](./Example.webp)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)

```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWCameraZoomOptionView.git", .upToNextMajor(from: "1.0.5"))
]
```

### Function - 可用函式
|函式|功能|
|-|-|
|configure(with:optionViewInformation:)|相關設定|
|selectItem(with:)|選擇選項|

### [WWCameraZoomOptionViewDelegate](https://ezgif.com/video-to-webp)
|函式|功能|
|-|-|
|itemCount(with:)|項目數量|
|labelText(with:index:)|項目文字|
|duration(with:index:)|動畫時間|
|cameraZoomOptionView(_:didSelected:)|項目被選到哪一個|
|cameraZoomOptionView(_:canTapWith:)|項目點擊能不能有反應|
|cameraZoomOptionView(_:scaleWith:)|項目縮放比例|

### Parameters - 參數
|參數|功能|
|-|-|
|currentSelectedIndex|當前被選到的Index|

### Example
```swift
import UIKit
import WWCameraZoomOptionView

final class ViewController: UIViewController {
    
    @IBOutlet weak var zoomOptionView: WWCameraZoomOptionView!
    
    private let textArray = ["0.5x", "1.0x", "2.0x", "5.0x"]
    private let option: WWCameraZoomOptionView.OptionViewInformation = (UIFont.systemFont(ofSize: 20), .red, .yellow.withAlphaComponent(0.7))
        
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomOptionView.configure(with: self, optionViewInformation: option)
    }
    
    @IBAction func selectItem(_ sender: UIBarButtonItem) {
        
        if let index = zoomOptionView.currentSelectedIndex {
            zoomOptionView.selectItem(with: index + 1)
        } else {
            zoomOptionView.selectItem(with: 0)
        }
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
```
