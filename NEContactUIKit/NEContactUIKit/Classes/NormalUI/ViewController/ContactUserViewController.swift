
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NECoreIMKit
import NECoreKit
import NIMSDK

@objcMembers
open class ContactUserViewController: NEBaseContactUserViewController {
  func initNormal() {
    className = "ContactUserViewController"
    headerView = UserInfoHeaderView()
  }

  override public init(user: User?) {
    super.init(user: user)
    initNormal()
  }

  override public init(uid: String) {
    super.init(uid: uid)
    initNormal()
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override open func commonUI() {
    super.commonUI()
    tableView.rowHeight = 62
  }

  override public func getContactRemakNameViewController() -> NEBaseContactRemakNameViewController {
    ContactRemakNameViewController()
  }
}
