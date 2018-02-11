//
//  ViewController.swift
//  NSTableViewByCode
//
//  Created by Zeo on 11/02/2018.
//  Copyright © 2018 Zeo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    lazy var tableView: NSTableView = {
        let tableview = NSTableView()
        return tableview
    }()
    
    lazy var scrollview: NSScrollView = {
        let scrollview = NSScrollView()
        return scrollview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configScrollView()
        self.configTableView()
    }
    
    func configScrollView() {
        self.view.addSubview(self.scrollview)
        self.scrollview.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        self.scrollview.hasVerticalScroller = true
        self.scrollview.hasHorizontalScroller = false
        self.scrollview.focusRingType = .none
        self.scrollview.autohidesScrollers = true
        self.scrollview.borderType = .bezelBorder
        self.scrollview.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollview.documentView = self.tableView
    }
    
    func configTableView() {
        self.tableView.focusRingType = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.gridStyleMask = .solidHorizontalGridLineMask
        self.tableView.gridColor = NSColor.red
        self.tableView.headerView = nil
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "column"))
        column.title = "column"
        column.width = 480
        column.maxWidth = column.width
        column.minWidth = column.width
        
        self.tableView.addTableColumn(column)
    }

    override var representedObject: Any? {
        didSet {
        }
    }

}

extension ViewController: NSTableViewDelegate {
    
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 100
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell  = tableView.makeView(withIdentifier: (tableColumn?.identifier)!, owner: self) as? CustomTableCellView
        
        if cell == nil {
            cell = CustomTableCellView()
        }
        
        let red1: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        let blue1: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        let green1: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        
        let red2: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        let blue2: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        let green2: CGFloat = CGFloat(Double((0...255).randomInt) / 255.0)
        
        cell?.view1.wantsLayer = true
        cell?.view1.layer?.backgroundColor = NSColor(calibratedRed: red1, green: green1, blue: blue1, alpha: 1).cgColor
        
        cell?.view2.wantsLayer = true
        cell?.view2.layer?.backgroundColor = NSColor(calibratedRed: red2, green: green2, blue: blue2, alpha: 1).cgColor
        
        return cell
    }
}
extension CountableRange {
    public var randomInt: Int {
        let start = lowerBound as! Int
        let end = (upperBound as! Int) - 1
        let count = UInt32(end - start)
        return Int(arc4random_uniform(count)) + start
    }
}

extension CountableClosedRange {
    public var randomInt: Int {
        let start = lowerBound as! Int
        let end = upperBound as! Int
        let count = UInt32(end - start)
        return Int(arc4random_uniform(count)) + start
    }
}
