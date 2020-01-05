//
//  ViewController.swift
//  OneTimeCodeTester
//
//  Created by Paulo Fierro on 5/1/20.
//  Copyright © 2020 Paulo Fierro. All rights reserved.
//

import MessageUI
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    @IBOutlet weak private var button: UIButton!
    @IBOutlet weak private var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the content type for the text field
        textField.textContentType = .oneTimeCode
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Ensure the textfield is selected and the keyboard is up
        textField.becomeFirstResponder()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        guard MFMessageComposeViewController.canSendText() else { return }

        let message = segmentedControl.selectedSegmentIndex == 0
            ? "Your confirmation code for is: 1234"
            : "Your confirmation code 🎉 is: 5678"

        let messageController = MFMessageComposeViewController()
        messageController.messageComposeDelegate = self
        messageController.body = message
        present(messageController, animated: true, completion: nil)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate & UINavigationControllerDelegate {

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
