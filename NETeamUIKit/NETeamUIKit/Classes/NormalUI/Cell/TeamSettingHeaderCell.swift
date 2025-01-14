
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NECommonUIKit

@objcMembers
open class TeamSettingHeaderCell: NEBaseTeamSettingHeaderCell {
  override open func setupUI() {
    super.setupUI()
    headerView.layer.cornerRadius = 21.0

    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 36),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -84),
    ])

    NSLayoutConstraint.activate([
      arrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      arrow.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -36),
    ])

    NSLayoutConstraint.activate([
      headerView.centerYAnchor.constraint(equalTo: arrow.centerYAnchor),
      headerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -64.0),
      headerView.widthAnchor.constraint(equalToConstant: 42.0),
      headerView.heightAnchor.constraint(equalToConstant: 42.0),
    ])
  }
}
