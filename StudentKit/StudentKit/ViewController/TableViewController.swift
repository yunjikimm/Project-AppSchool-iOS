//
//  TableViewController.swift
//  StudentKit
//
//  Created by yunjikim on 2023/06/14.
//

import UIKit

class TableViewController: UITableViewController {
    
    var message: String = "select a student."

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    // 하나의 tableviewcontroller에는 하나의 section과 해당 section의 여러 개의 row(cell)이 존재한다.
    // 테이블에 몇 개의 section이 있는지 알려준다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // section마다 몇 개의 row가 포함되어있는지 알려준다.
    // section 숫자만큼 호출된다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            // 학생의 숫자만큼 row를 만든다.
            return students.count
        default:
            return 0
        }
    }
    
    /* section과 row의 정보가 모아져 나온 indexPath 값에 맞춰 적절한 cell을 만들어 던져준다.
     화면에 보여지는 indexPath의 section, row만 가져온다.
     마치 "몇 학년 몇 반" 이야기만 듣고 학생 목록에서 적절한 이름을 찾아서 명함을 만들어 보내주는 역할과 같다. */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 새로운 cell을 만드는데, 스타일과 반복 사용될 때의 내부 이름을 정해준다.
        // reuseIdentifier: 테이블뷰의 여러개의 row을 가져오는 데 재사용되는 경우 각 cell을 식별하는 데 사용되는 문자열
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        
        print("section: \(indexPath.section), row: \(indexPath.row)")
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "\(message)"
        case 1:
            let row: Int = indexPath.row
            let number: Int = students[row].number
            let name: String = students[row].name
            // 만들어진 기본 cell의 모양을 다듬어준다. (명함의 이름을 새겨주자!)
            cell.textLabel?.text = "\(name)"
            cell.detailTextLabel?.text = "\(number)"
        default:
            break
        }
        
        return cell
    }
    
    // 특정 indexPath(section+row)의 cell을 클릭했을 때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 1:
            let row: Int = indexPath.row
            let number: Int = students[row].number
            let name: String = students[row].name
            
            message = "Hello, \(number) \(name)"
        default:
            break
        }
        
        tableView.reloadData()
    }

}
