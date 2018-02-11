//
//  CustomTableCellView.swift
//  NSTableViewByCode
//
//  Created by Zeo on 11/02/2018.
//  Copyright © 2018 Zeo. All rights reserved.
//

import Cocoa

class CustomTableCellView: NSTableCellView {
    
    lazy var view1: NSView = {
        let view = NSView()
        return view
    }()

    lazy var view2: NSView = {
        let view = NSView()
        return view
    }()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(self.view1)
        self.view1.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.left.top.equalToSuperview()
        }
        
        self.addSubview(self.view2)
        self.view2.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.left.equalToSuperview().offset(100)
            make.top.equalToSuperview()
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
