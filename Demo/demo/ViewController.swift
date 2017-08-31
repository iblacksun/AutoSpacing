//
//  ViewController.swift
//  demo
//
//  Created by Peng Guo on 2017/8/31.
//  Copyright © 2017年 Peng Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet fileprivate var topTextView: UITextView!
	@IBOutlet fileprivate var bottomTextView: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func autoSpacing(_ button: UIButton){
		bottomTextView.text = topTextView.text?.spaced
	}
}

