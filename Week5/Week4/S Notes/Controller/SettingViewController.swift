//
//  SettingViewController.swift
//  Week4
//
//  Created by mac on 2021/02/18.
//

import UIKit
import Floaty
import SnapKit
import Kingfisher


class SettingViewController: UIViewController{
    
    lazy var backgroundView = UIView()
    lazy var titleLabel = UILabel()
    lazy var highQualityImageView = UIImageView()
    
    let url = URL(string: "https://www.10wallpaper.com/wallpaper/1366x768/1401/mountains_reflection-Nature_Desktop_Wallpaper_1366x768.jpg")

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - SnapKit
        self.view.addSubview(backgroundView)
        backgroundView.backgroundColor = .cyan
        backgroundView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.equalTo(view.snp.leading).offset(0)
            //            make.center.equalTo(self.view)
            //            make.edges.equalToSuperview().inset(16)
        }
        
        backgroundView.addSubview(titleLabel)
        titleLabel.text = "SanpKit 사용해보자"
        titleLabel.textColor = .brown
        titleLabel.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()

        }
        
        // MARK: - Kingfisher
        
        let processor = DownsamplingImageProcessor(size: highQualityImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 0)
        highQualityImageView.kf.indicatorType = .activity
        highQualityImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "IU"),
            options: [
//                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        
//        highQualityImageView.kf.setImage(with: url)
        self.view.addSubview(highQualityImageView)
        highQualityImageView.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(backgroundView.snp.bottom)
        }
        
        // MARK: - Floaty
        let floaty = Floaty()
        
        floaty.paddingY = 100
        floaty.addItem("탈퇴하기", icon: UIImage(systemName: "arrowshape.turn.up.backward"), handler: { item in
            let alert = UIAlertController(title: "⚠️", message: "다시 한 번 생각해보세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "가지마", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            floaty.close()
        })
        
        floaty.addItem("리뷰쓰기", icon: UIImage(named: "Image")) { (FloatyItem) in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let reviewViewController = storyBoard.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
            self.present(reviewViewController, animated: true, completion: nil)
            
        }
        
        floaty.addItem("내 정보 설정", icon: UIImage(systemName: "square.and.pencil"))
        self.view.addSubview(floaty)
    }
}
