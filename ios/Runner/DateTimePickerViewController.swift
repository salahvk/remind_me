import UIKit

class DateTimePickerViewController: UIViewController {

    // MARK: - Properties
    var completion: ((String) -> Void)?

    // MARK: - UI Elements
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupDatePicker()
        setupButtons()
    }

    // MARK: - Setup DatePicker and Buttons
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(datePicker)

        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

    private func setupButtons() {
        // Cancel Button
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cancelButton)

        // OK Button
        let okButton = UIButton(type: .system)
        okButton.setTitle("OK", for: .normal)
        okButton.addTarget(self, action: #selector(okTapped), for: .touchUpInside)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(okButton)

        // Layout buttons
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),

            okButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            okButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - Button Actions
    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func okTapped() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = formatter.string(from: datePicker.date)
        completion?(selectedDate)
        self.dismiss(animated: true, completion: nil)
    }
}
