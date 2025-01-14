
// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import UIKit
import NIMSDK
import NECoreKit

@objcMembers
open class TeamListViewController: NEBaseTeamListViewController {
  override func commonUI() {
    super.commonUI()
    customNavigationView.backgroundColor = .white
    navigationController?.navigationBar.backgroundColor = .white
    tableView.register(
      TeamTableViewCell.self,
      forCellReuseIdentifier: "\(NSStringFromClass(TeamTableViewCell.self))"
    )
    tableView.rowHeight = 62
  }

  override public func tableView(_ tableView: UITableView,
                                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "\(NSStringFromClass(TeamTableViewCell.self))",
      for: indexPath
    ) as! TeamTableViewCell
    cell.setModel(viewModel.teamList[indexPath.row])
    return cell
  }
}
