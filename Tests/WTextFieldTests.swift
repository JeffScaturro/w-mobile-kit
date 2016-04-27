//
//  WTextFieldTests.swift
//  WMobileKit

import Quick
import Nimble
@testable import WMobileKit

class WTextFieldTests: QuickSpec {
    override func spec() {
        describe("WTextFieldSpec") {
            var subject: UIViewController!
            var textField: WTextField!

            beforeEach({
                subject = UIViewController()

                let window = UIWindow(frame: UIScreen.mainScreen().bounds)
                window.rootViewController = subject

                subject.beginAppearanceTransition(true, animated: false)
                subject.endAppearanceTransition()
            })

            describe("when app has been init") {
                it("should successfully add and display a text field with default settings") {
                    textField = WTextField()

                    subject.view.addSubview(textField)
                    textField.snp_makeConstraints { (make) in
                        make.centerX.equalTo(subject.view)
                        make.top.equalTo(subject.view).offset(10)
                        make.width.equalTo(160)
                        make.height.equalTo(30)
                    }

                    subject.view.layoutIfNeeded()

                    // public properties
                    expect(textField.imageSquareSize) == 16
                    expect(textField.paddingBetweenTextAndImage) == 8
                    expect(textField.bottomLineWidth) == 1
                    expect(textField.leftImage).to(beNil())
                    expect(textField.leftView).to(beNil())
                    expect(textField.rightImage).to(beNil())
                    expect(textField.rightView).to(beNil())
                    expect(textField.bottomLineColor) == UIColor.whiteColor()

                    // rect sizing
                    let textRect = textField.textRectForBounds(textField.bounds)
                    expect(textRect.origin.x) == 0
                    expect(textRect.origin.y) == 0
                    expect(textRect.width) == 160
                    expect(textRect.height) == 30

                    let placeHolderRect = textField.placeholderRectForBounds(textField.bounds)
                    expect(placeHolderRect.origin.x) == 0
                    expect(placeHolderRect.origin.y) == 0
                    expect(placeHolderRect.width) == 160
                    expect(placeHolderRect.height) == 30

                    let editingRect = textField.editingRectForBounds(textField.bounds)
                    expect(editingRect.origin.x) == 0
                    expect(editingRect.origin.y) == 0
                    expect(editingRect.width) == 160
                    expect(editingRect.height) == 30

                    let leftViewRect = textField.leftViewRectForBounds(textField.bounds)
                    expect(leftViewRect.origin.x) == 0 // (textField.height - imageSquareSize) / 2 = (30 - 16) / 2
                    expect(leftViewRect.origin.y) == 7
                    expect(leftViewRect.width) == 16
                    expect(leftViewRect.height) == 16

                    let rightViewRect = textField.rightViewRectForBounds(textField.bounds)
                    expect(rightViewRect.origin.x) == 144 // textField.width - imageSquareSize
                    expect(rightViewRect.origin.y) == 7
                    expect(rightViewRect.width) == 16
                    expect(rightViewRect.height) == 16
                }

                it("should successfully add and display a text field with custom configurations") {
                    textField = WTextField()

                    subject.view.addSubview(textField)
                    textField.snp_makeConstraints { (make) in
                        make.centerX.equalTo(subject.view)
                        make.top.equalTo(subject.view).offset(10)
                        make.width.equalTo(160)
                        make.height.equalTo(30)
                    }
                    textField.imageSquareSize = 20
                    textField.paddingBetweenTextAndImage = 10
                    textField.bottomLineWidth = 2
                    textField.bottomLineColor = .blueColor()

                    subject.view.layoutIfNeeded()

                    // public properties
                    expect(textField.imageSquareSize) == 20
                    expect(textField.paddingBetweenTextAndImage) == 10
                    expect(textField.bottomLineWidth) == 2
                    expect(textField.bottomLineColor) == UIColor.blueColor()

                    // rect sizing
                    let leftViewRect = textField.leftViewRectForBounds(textField.bounds)
                    expect(leftViewRect.width) == 20
                    expect(leftViewRect.height) == 20

                    let rightViewRect = textField.rightViewRectForBounds(textField.bounds)
                    expect(rightViewRect.origin.x) == 140 // textField.width - imageSquareSize
                    expect(rightViewRect.origin.y) == 5
                    expect(rightViewRect.width) == 20
                    expect(rightViewRect.height) == 20
                }

                it("should successfully add and display a text field with a left icon") {
                    textField = WTextField()

                    subject.view.addSubview(textField)
                    textField.snp_makeConstraints { (make) in
                        make.centerX.equalTo(subject.view)
                        make.top.equalTo(subject.view).offset(10)
                        make.width.equalTo(160)
                        make.height.equalTo(30)
                    }

                    // left image, with default 16x16 and 8 padding, 24 taken off of widths
                    textField.leftImage = UIImage()

                    subject.view.layoutIfNeeded()

                    // rect sizing
                    let textRect = textField.textRectForBounds(textField.bounds)
                    expect(textRect.origin.x) == 24
                    expect(textRect.width) == 136
                    expect(textRect.height) == 30

                    let placeHolderRect = textField.placeholderRectForBounds(textField.bounds)
                    expect(placeHolderRect.origin.x) == 24
                    expect(placeHolderRect.width) == 136
                    expect(placeHolderRect.height) == 30

                    let editingRect = textField.editingRectForBounds(textField.bounds)
                    expect(editingRect.origin.x) == 24
                    expect(editingRect.width) == 136
                    expect(editingRect.height) == 30
                }

                it("should successfully add and display a text field with a right icon") {
                    textField = WTextField()

                    subject.view.addSubview(textField)
                    textField.snp_makeConstraints { (make) in
                        make.centerX.equalTo(subject.view)
                        make.top.equalTo(subject.view).offset(10)
                        make.width.equalTo(160)
                        make.height.equalTo(30)
                    }

                    // left image, with default 16x16 and 8 padding, 24 taken off of widths
                    textField.rightImage = UIImage()

                    subject.view.layoutIfNeeded()

                    // rect sizing
                    let textRect = textField.textRectForBounds(textField.bounds)
                    expect(textRect.origin.x) == 0
                    expect(textRect.width) == 136
                    expect(textRect.height) == 30

                    let placeHolderRect = textField.placeholderRectForBounds(textField.bounds)
                    expect(placeHolderRect.origin.x) == 0
                    expect(placeHolderRect.width) == 136
                    expect(placeHolderRect.height) == 30

                    let editingRect = textField.editingRectForBounds(textField.bounds)
                    expect(editingRect.origin.x) == 0
                    expect(editingRect.width) == 136
                    expect(editingRect.height) == 30
                }

                it("should successfully add and display a text field with both icons set") {
                    textField = WTextField()

                    subject.view.addSubview(textField)
                    textField.snp_makeConstraints { (make) in
                        make.centerX.equalTo(subject.view)
                        make.top.equalTo(subject.view).offset(10)
                        make.width.equalTo(160)
                        make.height.equalTo(30)
                    }

                    // left image, with default 16x16 and 8 padding, 24 taken off of widths
                    textField.leftImage = UIImage()
                    textField.rightImage = UIImage()

                    subject.view.layoutIfNeeded()

                    // rect sizing
                    let textRect = textField.textRectForBounds(textField.bounds)
                    expect(textRect.origin.x) == 24
                    expect(textRect.width) == 112
                    expect(textRect.height) == 30
                    
                    let placeHolderRect = textField.placeholderRectForBounds(textField.bounds)
                    expect(placeHolderRect.origin.x) == 24
                    expect(placeHolderRect.width) == 112
                    expect(placeHolderRect.height) == 30
                    
                    let editingRect = textField.editingRectForBounds(textField.bounds)
                    expect(editingRect.origin.x) == 24
                    expect(editingRect.width) == 112
                    expect(editingRect.height) == 30
                }
            }
        }
    }
}