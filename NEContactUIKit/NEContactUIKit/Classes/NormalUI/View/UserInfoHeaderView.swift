
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NECoreIMKit

@objcMembers
open class UserInfoHeaderView: NEBaseUserInfoHeaderView {
  override public func commonUI() {
    super.commonUI()
    avatarImage.layer.cornerRadius = 30

    NSLayoutConstraint.activate([
      lineView.leftAnchor.constraint(equalTo: leftAnchor),
      lineView.rightAnchor.constraint(equalTo: rightAnchor),
      lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
      lineView.heightAnchor.constraint(equalToConstant: 6),
    ])
  }

  override public func setData(user: User?) {
    super.setData(user: user)
    guard let u = user else {
      return
    }
    // title

    if let alias = u.alias, !alias.isEmpty {
      commonUI(showDetail: true)
      titleLabel.text = alias
      let uid = u.userId ?? ""
      detailLabel.text = "\(localizable("nick")):\(u.userInfo?.nickName ?? uid)"
      detailLabel2.text = "\(localizable("account")):\(uid)"
    } else {
      commonUI(showDetail: false)
      titleLabel.text = u.showName()
      detailLabel.text = "\(localizable("account")):\(u.userId ?? "")"
    }
  }
}
