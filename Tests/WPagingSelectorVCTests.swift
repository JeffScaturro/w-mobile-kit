//
//  WPagingSelectorVCTests.swift
//  WMobileKit

import Quick
import Nimble
@testable import WMobileKit

class WPagingSelectorVCSpec: QuickSpec {
    override func spec() {
        describe("WPagingSelectorVCSpec") {
            var subject: WPagingSelectorVC!

            var vc1: WSideMenuContentVC?
            var vc2: WSideMenuContentVC?
            var vc3: WSideMenuContentVC?

            var pages: [WPage]!
            var titles: [String]!

            beforeEach({
                subject = WPagingSelectorVC()

                vc1 = WSideMenuContentVC()
                vc2 = WSideMenuContentVC()
                vc3 = WSideMenuContentVC()

                vc1!.view.backgroundColor = .greenColor()
                vc2!.view.backgroundColor = .blueColor()
                vc3!.view.backgroundColor = .redColor()

                let window = UIWindow(frame: UIScreen.mainScreen().bounds)
                window.rootViewController = subject

                subject.beginAppearanceTransition(true, animated: false)
                subject.endAppearanceTransition()

                titles = [
                    "Green VC",
                    "Blue VC",
                    "Red VC"
                ]

                pages = [
                    WPage(title: titles[0], viewController: vc1),
                    WPage(title: titles[1], viewController: vc2),
                    WPage(title: titles[2], viewController: vc3)
                ]

                subject.pages = pages
            })

            describe("when app has been init") {
                it("should have the correct properties set") {
                    subject.tabWidth = DEFAULT_TAB_WIDTH

                    expect(subject.tabWidth).to(equal(DEFAULT_TAB_WIDTH))
                    expect(subject.pagingControlHeight).to(equal(DEFAULT_PAGING_SELECTOR_HEIGHT))
                    expect(subject.tabTextColor).to(equal(UIColor.blackColor()))
                }
            }

            describe("tabs") { 
                it("should change tabs to the indexed tab") {
                    subject.willChangeToTab(subject.pagingSelectorControl!, tab: 0)
                }

                it("should change current index to the tab") {
                    subject.didChangeToTab(subject.pagingSelectorControl!, tab: 0)

                    expect(subject.currentPageIndex).to(equal(0))

                    subject.didChangeToTab(subject.pagingSelectorControl!, tab: 1)

                    expect(subject.currentPageIndex).to(equal(1))
                }
            }

            describe("WTabView") {
                var tabView: WTabView!

                it("should init with coder correctly") {
                    tabView = WTabView(title: "Tab")

                    let path = NSTemporaryDirectory() as NSString
                    let locToSave = path.stringByAppendingPathComponent("WTabView")

                    NSKeyedArchiver.archiveRootObject(tabView, toFile: locToSave)

                    let object = NSKeyedUnarchiver.unarchiveObjectWithFile(locToSave) as! WTabView

                    expect(object).toNot(equal(nil))

                    // default settings from commonInit
                }
            }

            describe("WSelectionIndicatorView") {
                var selectionIndicatorView: WSelectionIndicatorView!

                it("should init with coder correctly") {
                    selectionIndicatorView = WSelectionIndicatorView()

                    let path = NSTemporaryDirectory() as NSString
                    let locToSave = path.stringByAppendingPathComponent("WSelectionIndicatorView")

                    NSKeyedArchiver.archiveRootObject(selectionIndicatorView, toFile: locToSave)

                    let object = NSKeyedUnarchiver.unarchiveObjectWithFile(locToSave) as! WSelectionIndicatorView

                    expect(object).toNot(equal(nil))
                    
                    // default settings from commonInit
                }
            }

            describe("WPagingSelectorControl") {
                var pagingSelectorControl: WPagingSelectorControl!

                it("should init with titles") {
                    pagingSelectorControl = WPagingSelectorControl(titles: titles)

                    expect(pagingSelectorControl).toNot(beNil())
                }

                it("should init with titles and tabWidth") {
                    pagingSelectorControl = WPagingSelectorControl(titles: titles, tabWidth: 40)

                    expect(pagingSelectorControl).toNot(beNil())
                }

                it("should init with pages") {
                    pagingSelectorControl = WPagingSelectorControl(pages: pages)

                    expect(pagingSelectorControl).toNot(beNil())
                }

                it("should init with coder correctly") {
                    pagingSelectorControl = WPagingSelectorControl(titles: titles)

                    let path = NSTemporaryDirectory() as NSString
                    let locToSave = path.stringByAppendingPathComponent("WPagingSelectorControl")

                    NSKeyedArchiver.archiveRootObject(pagingSelectorControl, toFile: locToSave)

                    let object = NSKeyedUnarchiver.unarchiveObjectWithFile(locToSave) as! WPagingSelectorControl

                    expect(object).toNot(equal(nil))

                    // default settings from commonInit
                }
            }
        }
    }
}