
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NECoreIMKit
import Foundation
import NECoreKit

@objcMembers
open class ContactTableViewCell: NEBaseContactTableViewCell {
  override open func setConfig() {
    super.setConfig()
    titleLabel.font = NEKitContactConfig.shared.ui.titleFont ?? UIFont.systemFont(ofSize: 14)
  }

  override open func commonUI() {
    super.commonUI()
    bottomLine.backgroundColor = .ne_greyLine
  }

  override open func setupCommonCircleHeader() {
    super.setupCommonCircleHeader()
    NSLayoutConstraint.activate([
      avatarImage.widthAnchor.constraint(equalToConstant: 36),
      avatarImage.heightAnchor.constraint(equalToConstant: 36),
      avatarImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
    ])
  }

  override open func setModel(_ model: ContactInfo) {
    super.setModel(model)
    if model.contactCellType == 2 {
      bottomLine.isHidden = true
    }
  }
}
