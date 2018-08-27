//
//  FilterController.swift
//  FilterImage
//
//  Created by Kazuo Tsubaki on 2018/08/21.
//  Copyright © 2018年 Kazuo Tsubaki. All rights reserved.
//

import UIKit

class FilterController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paramView: UIView!

    var categories: [String] = Filters.shared.categories()
    var selectedFilter: Filter! {
        didSet {
            if selectedFilter != nil {
                if let filters = Filters.shared.filters(inCategory: selectedFilter.category!) {
                    var rowIndex = 0
                    for filter in filters {
                        if filter.name == selectedFilter.name {
                            let sectionIndex = categories.index(of: selectedFilter.category!)
                            let indexPath = IndexPath(row: rowIndex, section: sectionIndex!)
                            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .middle)
                            self.changeFilterSelection()
                        }
                        rowIndex = rowIndex + 1
                    }
                }
            }
        }
    }
    var filterParamView: FilterParamView!
    var filterParamViewDict: [String: FilterParamView] = [:]
    
    static let FilterSelected = Notification.Name("FilterSelected")
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        filterParamViewDict["CIColorMonochrome"] = CIColorMonochromeParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorPosterize"] = CIColorPosterizeParamView(frame: CGRect.zero)
        filterParamViewDict["CINoiseReduction"] = CINoiseReductionParamView(frame: CGRect.zero)
        filterParamViewDict["CIBoxBlur"] = CIBoxBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIDiscBlur"] = CIDiscBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIGaussianBlur"] = CIGaussianBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIMedianFilter"] = CIMedianFilterParamView(frame: CGRect.zero)
        filterParamViewDict["CIMotionBlur"] = CIMotionBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIZoomBlur"] = CIZoomBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorClamp"] = CIColorClampParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorControls"] = CIColorControlsParamView(frame: CGRect.zero)
        filterParamViewDict["CIExposureAdjust"] = CIExposureAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIGammaAdjust"] = CIGammaAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIHueAdjust"] = CIHueAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CILinearToSRGBToneCurve"] = CILinearToSRGBToneCurveParamView(frame: CGRect.zero)
        filterParamViewDict["CISRGBToneCurveToLinear"] = CISRGBToneCurveToLinearParamView(frame: CGRect.zero)
        filterParamViewDict["CITemperatureAndTint"] = CITemperatureAndTintParamView(frame: CGRect.zero)
        filterParamViewDict["CIVibrance"] = CIVibranceParamView(frame: CGRect.zero)
        filterParamViewDict["CIWhitePointAdjust"] = CIWhitePointAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorInvert"] = CIColorInvertParamView(frame: CGRect.zero)
        filterParamViewDict["CIFalseColor"] = CIFalseColorParamView(frame: CGRect.zero)
        filterParamViewDict["CIMaskToAlpha"] = CIMaskToAlphaParamView(frame: CGRect.zero)
        filterParamViewDict["CIMinimumComponent"] = CIMinimumComponentParamView(frame: CGRect.zero)
        filterParamViewDict["CIMaximumComponent"] = CIMaximumComponentParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectChrome"] = CIPhotoEffectChromeParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectFade"] = CIPhotoEffectFadeParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectInstant"] = CIPhotoEffectInstantParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectMono"] = CIPhotoEffectMonoParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectNoir"] = CIPhotoEffectNoirParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectProcess"] = CIPhotoEffectProcessParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectTonal"] = CIPhotoEffectTonalParamView(frame: CGRect.zero)
        filterParamViewDict["CISepiaTone"] = CISepiaToneParamView(frame: CGRect.zero)
        filterParamViewDict["CIVignette"] = CIVignetteParamView(frame: CGRect.zero)
        filterParamViewDict["CIVignetteEffect"] = CIVignetteEffectParamView(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        filterParamViewDict["CIColorMonochrome"] = CIColorMonochromeParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorPosterize"] = CIColorPosterizeParamView(frame: CGRect.zero)
        filterParamViewDict["CINoiseReduction"] = CINoiseReductionParamView(frame: CGRect.zero)
        filterParamViewDict["CIBoxBlur"] = CIBoxBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIDiscBlur"] = CIDiscBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIGaussianBlur"] = CIGaussianBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIMedianFilter"] = CIMedianFilterParamView(frame: CGRect.zero)
        filterParamViewDict["CIMotionBlur"] = CIMotionBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIZoomBlur"] = CIZoomBlurParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorClamp"] = CIColorClampParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorControls"] = CIColorControlsParamView(frame: CGRect.zero)
        filterParamViewDict["CIExposureAdjust"] = CIExposureAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIGammaAdjust"] = CIGammaAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIHueAdjust"] = CIHueAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CILinearToSRGBToneCurve"] = CILinearToSRGBToneCurveParamView(frame: CGRect.zero)
        filterParamViewDict["CISRGBToneCurveToLinear"] = CISRGBToneCurveToLinearParamView(frame: CGRect.zero)
        filterParamViewDict["CITemperatureAndTint"] = CITemperatureAndTintParamView(frame: CGRect.zero)
        filterParamViewDict["CIVibrance"] = CIVibranceParamView(frame: CGRect.zero)
        filterParamViewDict["CIWhitePointAdjust"] = CIWhitePointAdjustParamView(frame: CGRect.zero)
        filterParamViewDict["CIColorInvert"] = CIColorInvertParamView(frame: CGRect.zero)
        filterParamViewDict["CIFalseColor"] = CIFalseColorParamView(frame: CGRect.zero)
        filterParamViewDict["CIMaskToAlpha"] = CIMaskToAlphaParamView(frame: CGRect.zero)
        filterParamViewDict["CIMinimumComponent"] = CIMinimumComponentParamView(frame: CGRect.zero)
        filterParamViewDict["CIMaximumComponent"] = CIMaximumComponentParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectChrome"] = CIPhotoEffectChromeParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectFade"] = CIPhotoEffectFadeParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectInstant"] = CIPhotoEffectInstantParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectMono"] = CIPhotoEffectMonoParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectNoir"] = CIPhotoEffectNoirParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectProcess"] = CIPhotoEffectProcessParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectTonal"] = CIPhotoEffectTonalParamView(frame: CGRect.zero)
        filterParamViewDict["CIPhotoEffectTransfer"] = CIPhotoEffectTransferParamView(frame: CGRect.zero)
        filterParamViewDict["CISepiaTone"] = CISepiaToneParamView(frame: CGRect.zero)
        filterParamViewDict["CIVignette"] = CIVignetteParamView(frame: CGRect.zero)
        filterParamViewDict["CIVignetteEffect"] = CIVignetteEffectParamView(frame: CGRect.zero)
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func okClicked(_ sender: UIButton)  {
        if filterParamView != nil {
            filterParamView.applyChanges()
            NotificationCenter.default.post(name: FilterController.FilterSelected, object: self, userInfo: ["selectedFilter": self.selectedFilter])
       }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func changeFilterSelection() {
        paramView.subviews.forEach { (v) in
            v.removeFromSuperview()
        }
        filterParamView = nil
        
        createFilerParamView()
    }
    
    private func createFilerParamView() {
        let rect = CGRect(x: 0, y: 0, width: paramView.frame.width, height: paramView.frame.height)
        guard let pv = filterParamViewDict[selectedFilter.name!] else { return }
        pv.frame = rect
        filterParamView = pv
        paramView.addSubview(pv)
        pv.filter = selectedFilter
    }
}

extension FilterController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cat = categories[section]
        return CIFilter.localizedName(forCategory: cat)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = categories[section]
        if let filters = Filters.shared.filters(inCategory: category) {
            return filters.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell")
        cell?.textLabel?.text = "Unknown"
        let category = categories[indexPath.section]
        let filters = Filters.shared.filters(inCategory: category)
        let filter = filters![indexPath.row]
        cell?.textLabel?.text = filter.filterName()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.section]
        let filters = Filters.shared.filters(inCategory: category)
        selectedFilter = filters![indexPath.row].copy() as! Filter
        
        self.changeFilterSelection()
    }
    
}

