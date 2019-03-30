//
//  TableViewController.swift
//  ExampleInfiniteTable
//
//  Created by Ivan Kramarchuk on 30/03/2019.
//  Copyright © 2019 homework.com. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var array = [String](repeating: "", count: 50)
    let countAdds = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.prefetchDataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

}

extension TableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt \(indexPaths)")
        let indexPath = indexPaths[0]
        if indexPath.row + countAdds > array.count {
            print("add \(indexPath)")
            for _ in 1...countAdds {
                array.append("")
            }
            self.tableView.reloadData()
            //if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
            //    self.tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
            //}
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt \(indexPaths)")
    }
}
