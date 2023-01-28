//
//  FilterView.swift
//  SpaceX
//
//  Created by Nitin Soni on 28/01/23.
//

import UIKit

protocol FilterViewDelegate {
    func filterbyYear(isApplied : Bool, year : String?)
    func filterBySuccessfulLaunch(isApplied : Bool)
    func filterByASC_DSC(asc : Bool)
}

class FilterView: UIView {
  
    @IBOutlet var btnFilterByYear : UIButton!
    @IBOutlet var btnSussefulLaunch : UIButton!
    @IBOutlet var btnASC_DSC : UIButton!
    @IBOutlet var txtYear : UITextField!
    var  delegate : FilterViewDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func btnFilterByYearAction(_ sender : UIButton) {
        if let btnImage  = sender.image(for: .normal), btnImage == UIImage(named: "checkBox.png"){
          
                btnFilterByYear.setImage(UIImage(named: "uncheckedBox.png"), for: .normal)
                self.delegate?.filterbyYear(isApplied: false, year: nil)
            
        }else{
            btnFilterByYear.setImage(UIImage(named: "checkBox.png"), for: .normal)
            self.delegate?.filterbyYear(isApplied: true, year: self.txtYear.text)
        }
        
        btnSussefulLaunch.setImage(UIImage(named: "uncheckedBox"), for: .normal)
        btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
       
        
    }
    @IBAction func btnSussefulLaunchAction(_ sender : UIButton) {
        if let btnImage  = sender.image(for: .normal), btnImage == UIImage(named: "checkBox"){
            btnSussefulLaunch.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            self.delegate?.filterBySuccessfulLaunch(isApplied: false)
        }else{
            btnSussefulLaunch.setImage(UIImage(named: "checkBox"), for: .normal)
            self.delegate?.filterBySuccessfulLaunch(isApplied: true)
        }
        
        btnFilterByYear.setImage(UIImage(named: "uncheckedBox.png"), for: .normal)
        btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
    }
    @IBAction func btnASC_DSCAction(_ sender : UIButton) {
        if let btnImage  = sender.image(for: .normal), btnImage == UIImage(named: "checkBox"){
            btnASC_DSC.setImage(UIImage(named: "uncheckedBox"), for: .normal)
            self.delegate?.filterByASC_DSC(asc: false)
        }else{
            btnASC_DSC.setImage(UIImage(named: "checkBox"), for: .normal)
            self.delegate?.filterByASC_DSC(asc: true)
        }
        
        btnFilterByYear.setImage(UIImage(named: "uncheckedBox.png"), for: .normal)
        btnFilterByYear.setImage(UIImage(named: "uncheckedBox.png"), for: .normal)
        
    }
    

}
