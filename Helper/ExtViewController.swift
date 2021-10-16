//
//  ExtViewController.swift
//  CodingChallenge
//
//  Created by kanagasabapathy on 12/10/21.
//

import UIKit

import RxSwift
import RxCocoa

extension UIViewController {
    func presentAlert(title: String?, message: String?) -> Observable<Void> {
        let result = PublishSubject<Void>()
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            result.onNext(())
            result.onCompleted()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            result.onCompleted()
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
        return result
    }
}

//self.presentAlert(title: "Add Station", message: "Do you want to add a station to your favorites?")
