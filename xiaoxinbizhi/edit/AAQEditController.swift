//
//  AAQEditController.swift
//  fashionColor
//
//  Created by mac on 2019/7/30.
//  Copyright © 2019 bh. All rights reserved.
//

import UIKit
import TangramKit

typealias AAQEditControllerBlock = (UIImage) -> Void
class AAQEditController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "添加图片"

        let btnShare = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 40))
        btnShare.tintColor = .mainColor()
        btnShare.setImage(UIImage.init(named: "shangchuantupian")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnShare.addTarget(self, action: #selector(btnShareAction), for: .touchUpInside)
        let itemShare = UIBarButtonItem.init(customView: btnShare)
        
        self.navigationItem.rightBarButtonItems = [itemShare]
    }
    
    @objc func btnShareAction() {
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
//        photoPicker.allowsEditing = true
        photoPicker.sourceType = .photoLibrary
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image : UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.vImg2?.image = image

        self.dismiss(animated: true) {
            
        }
        
    }
    
    @objc func addPictureAction() {
        
    }
    
    var vImg : UIImageView?
    var image : UIImage!
    var vImg2 : UIImageView?
    var block : AAQEditControllerBlock?
    var viewCapture : TGRelativeLayout?
    var index : Int!

    override func loadView() {
        let view = TGRelativeLayout.init()
        view.tg_insetsPaddingFromSafeArea = .all
        view.backgroundColor = UIColor.bgMainColor()
        self.view = view
        
        let viewCapture = TGRelativeLayout.init()
        viewCapture.tg_top.equal(YZWMathSize.rate(rate: 30))
        viewCapture.tg_centerX.equal(0)
        viewCapture.tg_size(.wrap)
        view.addSubview(viewCapture)
        self.viewCapture = viewCapture
        
        let vImg = UIImageView.init()
        vImg.tg_size(width: aaqScreenWidth * 0.5, height: aaqScreenHeight * 0.5)
        vImg.backgroundColor = .mainColor()
        vImg.image = self.image
        viewCapture.addSubview(vImg)
        self.vImg = vImg
        
        let vImg2 = UIImageView.init()
        vImg2.tg_size(width: aaqScreenWidth * 0.5, height: aaqScreenHeight * 0.5)
        vImg2.alpha = 0.1
        vImg2.image = self.image
        vImg2.contentMode = .scaleAspectFill
        vImg2.image = UIImage.init(named: "image_0")
        vImg2.layer.masksToBounds = true
        viewCapture.addSubview(vImg2)
        self.vImg2 = vImg2
        
        let btnSave = UIButton.init()
        btnSave.tg_size(width: YZWMathSize.rate(rate: 80), height: YZWMathSize.rate(rate: 30))
        btnSave.layer.cornerRadius = YZWMathSize.rate(rate: 15)
        btnSave.tg_centerX.equal(0)
        btnSave.tg_top.equal(viewCapture.tg_bottom).offset(YZWMathSize.rate(rate: 15))
        btnSave.titleLabel?.font = UIFont.fontRate(size: 14)
        btnSave.backgroundColor = .textMainColor()
        btnSave.setTitle("保存", for: .normal)
        btnSave.addTarget(self, action: #selector(btnSaveAction), for: .touchUpInside)
        view.addSubview(btnSave)
        
        let chooseView = AAQEditChooseView.aaqColloectLayout()
        chooseView.tg_bottom.equal(YZWMathSize.rate(rate: 30))
        view.addSubview(chooseView)
        
        chooseView.imgCallBack = { (image) in
            
            vImg2.image = image
            
        }
        
    }
    
    @objc func btnSaveAction() {
        AAQColorSingle.shareInstance.replaceBookMark(str: ((self.viewCapture?.capture)!.pngData()?.base64EncodedString())!, index: self.index)
        self.block!((self.viewCapture?.capture)!)
        self.navigationController?.popViewController(animated: true)
    }

}
