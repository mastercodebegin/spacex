//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Snehil Gehlot on 27/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    var lauchArr = [Launch]()
    var filteredLauchArr = [Launch]()
    var objCompanyInfot : AnyObject = CompanyInfo.self as AnyObject
    @IBOutlet var tblHome : UITableView?
    var sectionCount : Int =  0
    var objFilterView : FilterView?
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let dispatch =  DispatchQueue(label : "com.app")
        dispatch.async {
            ApiHandler().getCompanyInfo { (companyInfo) in
                self.objCompanyInfot =  companyInfo as AnyObject

                self.sectionCount = 1
                self.tblHome?.reloadData()
            }
        }
        dispatch.async {
            ApiHandler().getLaunchList { (launches) in
                self.lauchArr = launches
                self.filteredLauchArr =  self.lauchArr
                self.sectionCount = 2
                self.tblHome?.reloadData()

            }

        }
        
    }
    
    func showAction (currentIndex : Int){
        
        let currentLaunch =  self.filteredLauchArr[currentIndex]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
       
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Open wikipedia", style: .default , handler:{ (UIAlertAction)in
                vc.commonUrl = currentLaunch.links?.wikipedia
                self.navigationController?.pushViewController(vc, animated: true)
            }))
        
            alert.addAction(UIAlertAction(title: "Open article", style: .default , handler:{ (UIAlertAction)in
                vc.commonUrl = currentLaunch.links?.article
                self.navigationController?.pushViewController(vc, animated: true)
             
            }))
            
            alert.addAction(UIAlertAction(title: "Open Video", style: .default , handler:{ (UIAlertAction)in
                vc.commonUrl = currentLaunch.links?.webcast
                self.navigationController?.pushViewController(vc, animated: true)
            }))
        
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel , handler:{ (UIAlertAction)in
            print("User click Edit button")
           }))
        

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
    
    @IBAction func btnFilter(_ sender : Any){
        
        if let filterView = self.objFilterView, self.view.subviews.contains(filterView) {
            self.objFilterView?.txtYear.text = "";
            self.objFilterView?.btnFilterByYear.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            //self.objFilterView?.btnSussefulLaunch.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            //self.objFilterView?.btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            self.objFilterView?.removeFromSuperview()
        }else{
            
            if let filterView = self.objFilterView{
                self.objFilterView?.txtYear.text = "";
                self.objFilterView?.btnFilterByYear.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                //self.objFilterView?.btnSussefulLaunch.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                //self.objFilterView?.btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                self.view.addSubview(filterView)
            }else{
                if let filterView =  Bundle.main.loadNibNamed("FilterView", owner: 0, options: nil)?.first as? FilterView{
                    self.objFilterView?.txtYear.text = "";
                    self.objFilterView?.btnFilterByYear.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                   // self.objFilterView?.btnSussefulLaunch.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                    //self.objFilterView?.btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
                    self.objFilterView = filterView
                    filterView.delegate = self
                    self.view.addSubview(filterView)
                }
            }
        }
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{


        func numberOfSections(in tableView: UITableView) -> Int {
            return sectionCount
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0{
                return 1
            }else {
                return self.filteredLauchArr.count
            }
           
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return UITableView.automaticDimension

        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyInfoCell") as! CompanyInfoCell
               
                cell.lblCompanyInfoCell.text = (self.objCompanyInfot as! CompanyInfo).name! + " was found by" + (self.objCompanyInfot as! CompanyInfo).founder! + " in" + String((self.objCompanyInfot as! CompanyInfo).founded!) + " it has now" + String((self.objCompanyInfot as! CompanyInfo).employees!) + " " + String((self.objCompanyInfot as! CompanyInfo).launch_sites!) + " Launch side and value is in USD " + String((self.objCompanyInfot as! CompanyInfo).valuation!)
                return cell
            }else{
                let currentLaunch =  self.filteredLauchArr[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCell") as! LaunchCell
                cell.launchMission.text = currentLaunch.name
                cell.launchDateTime.text = Shared.sharedInstance.getDate(strDate: currentLaunch.date_utc!) + " " + Shared.sharedInstance.changeFormat(str: currentLaunch.date_utc!)
                
                cell.launchRocket.text = currentLaunch.name!
                if let dateutc = currentLaunch.date_utc, let imageUrl = currentLaunch.links?.patch?.small{
                    if let days = dateutc.getLaunchDate()?.interval(ofComponent: .day, fromDate: Date()){
                        if days < 0 {
                            cell.launchDays.text = "Since \(abs(days))"
                        }else{
                            cell.launchDays.text = "From \(abs(days))"
                        }
                        
                    }
                    cell.launchImage.setImage(strUrl: imageUrl)
                  
                }
                return cell
            }

        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            self.showAction(currentIndex: indexPath.row)
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor.black
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
        if section == 0{
            label.text = "Company"
        }else{
            label.text = "Launches"
        }
           
            label.font = .systemFont(ofSize: 16)
            label.textColor = .yellow
            
            headerView.addSubview(label)
            
            return headerView
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
        }

}

extension HomeViewController : FilterViewDelegate{
    
    
    func filterbyYear(isApplied : Bool, year : String?){
        if isApplied {
            let filteredLaunch = self.lauchArr.filter { (launch) -> Bool in
               
                if let dateUTC = launch.date_utc{
                    return Shared.sharedInstance.getYear(strDate: dateUTC) ==  year
                }else{
                    return false
                }
            }
            self.filteredLauchArr = filteredLaunch
        }else{
            self.filteredLauchArr = self.lauchArr
        }
        
        self.tblHome?.reloadData()
        self.objFilterView?.removeFromSuperview()
       
    }
    
    func filterBySuccessfulLaunch(isApplied : Bool){
        if isApplied {
            let filteredLaunch = self.lauchArr.filter { (launch) -> Bool in
                
                return launch.success ?? false
               
//                if let launchSuccses = launch.success{
//                    return launchSuccses ==  true
//                }else{
//                    return false
//                }
            }
            self.filteredLauchArr = filteredLaunch
        }else{
            self.filteredLauchArr = self.lauchArr
        }
        
        self.tblHome?.reloadData()
        self.objFilterView?.removeFromSuperview()
        
    }
    func filterByASC_DSC(asc : Bool){
        
            let filteredLaunch = self.lauchArr.sorted { (launch1, launch2) -> Bool in
                if let date1 = launch1.date_utc?.getLaunchDate(),  let date2 = launch2.date_utc?.getLaunchDate(){
                    if asc{
                       return date1.compare(date2) == .orderedAscending
                    }else{
                     return  date1.compare(date2) == .orderedDescending
                    }
                }
               return false
            
            }
            self.filteredLauchArr = filteredLaunch
        
        
        
        self.tblHome?.reloadData()
        self.objFilterView?.removeFromSuperview()
        
    }
    
}


