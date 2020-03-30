//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `MainViewController`, and contains static references to 1 segues.
    struct mainViewController {
      /// Segue identifier `DetailView`.
      static let detailView: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, MainViewController, DetailViewController> = Rswift.StoryboardSegueIdentifier(identifier: "DetailView")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `DetailView`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func detailView(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, MainViewController, DetailViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.mainViewController.detailView, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `DetailViewController`.
    static let detailViewController = _R.storyboard.detailViewController()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `MainViewController`.
    static let mainViewController = _R.storyboard.mainViewController()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "DetailViewController", bundle: ...)`
    static func detailViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.detailViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "MainViewController", bundle: ...)`
    static func mainViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.mainViewController)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 7 files.
  struct file {
    /// Resource file `adventpro-bold.ttf`.
    static let adventproBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-bold", pathExtension: "ttf")
    /// Resource file `adventpro-extralight.ttf`.
    static let adventproExtralightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-extralight", pathExtension: "ttf")
    /// Resource file `adventpro-light.ttf`.
    static let adventproLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-light", pathExtension: "ttf")
    /// Resource file `adventpro-medium.ttf`.
    static let adventproMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-medium", pathExtension: "ttf")
    /// Resource file `adventpro-regular.ttf`.
    static let adventproRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-regular", pathExtension: "ttf")
    /// Resource file `adventpro-semibold.ttf`.
    static let adventproSemiboldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-semibold", pathExtension: "ttf")
    /// Resource file `adventpro-thin.ttf`.
    static let adventproThinTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "adventpro-thin", pathExtension: "ttf")

    /// `bundle.url(forResource: "adventpro-bold", withExtension: "ttf")`
    static func adventproBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-extralight", withExtension: "ttf")`
    static func adventproExtralightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproExtralightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-light", withExtension: "ttf")`
    static func adventproLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-medium", withExtension: "ttf")`
    static func adventproMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-regular", withExtension: "ttf")`
    static func adventproRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-semibold", withExtension: "ttf")`
    static func adventproSemiboldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproSemiboldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "adventpro-thin", withExtension: "ttf")`
    static func adventproThinTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adventproThinTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 7 fonts.
  struct font: Rswift.Validatable {
    /// Font `AdventPro-Bold`.
    static let adventProBold = Rswift.FontResource(fontName: "AdventPro-Bold")
    /// Font `AdventPro-ExtraLight`.
    static let adventProExtraLight = Rswift.FontResource(fontName: "AdventPro-ExtraLight")
    /// Font `AdventPro-Light`.
    static let adventProLight = Rswift.FontResource(fontName: "AdventPro-Light")
    /// Font `AdventPro-Medium`.
    static let adventProMedium = Rswift.FontResource(fontName: "AdventPro-Medium")
    /// Font `AdventPro-Regular`.
    static let adventProRegular = Rswift.FontResource(fontName: "AdventPro-Regular")
    /// Font `AdventPro-SemiBold`.
    static let adventProSemiBold = Rswift.FontResource(fontName: "AdventPro-SemiBold")
    /// Font `AdventPro-Thin`.
    static let adventProThin = Rswift.FontResource(fontName: "AdventPro-Thin")

    /// `UIFont(name: "AdventPro-Bold", size: ...)`
    static func adventProBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProBold, size: size)
    }

    /// `UIFont(name: "AdventPro-ExtraLight", size: ...)`
    static func adventProExtraLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProExtraLight, size: size)
    }

    /// `UIFont(name: "AdventPro-Light", size: ...)`
    static func adventProLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProLight, size: size)
    }

    /// `UIFont(name: "AdventPro-Medium", size: ...)`
    static func adventProMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProMedium, size: size)
    }

    /// `UIFont(name: "AdventPro-Regular", size: ...)`
    static func adventProRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProRegular, size: size)
    }

    /// `UIFont(name: "AdventPro-SemiBold", size: ...)`
    static func adventProSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProSemiBold, size: size)
    }

    /// `UIFont(name: "AdventPro-Thin", size: ...)`
    static func adventProThin(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: adventProThin, size: size)
    }

    static func validate() throws {
      if R.font.adventProBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-Bold' could not be loaded, is 'adventpro-bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProExtraLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-ExtraLight' could not be loaded, is 'adventpro-extralight.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-Light' could not be loaded, is 'adventpro-light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-Medium' could not be loaded, is 'adventpro-medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-Regular' could not be loaded, is 'adventpro-regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-SemiBold' could not be loaded, is 'adventpro-semibold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.adventProThin(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'AdventPro-Thin' could not be loaded, is 'adventpro-thin.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 41 images.
  struct image {
    /// Image `australia-aud`.
    static let australiaAud = Rswift.ImageResource(bundle: R.hostingBundle, name: "australia-aud")
    /// Image `back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "back")
    /// Image `brazil-brl`.
    static let brazilBrl = Rswift.ImageResource(bundle: R.hostingBundle, name: "brazil-brl")
    /// Image `bulgaria-bgn`.
    static let bulgariaBgn = Rswift.ImageResource(bundle: R.hostingBundle, name: "bulgaria-bgn")
    /// Image `canada-cad`.
    static let canadaCad = Rswift.ImageResource(bundle: R.hostingBundle, name: "canada-cad")
    /// Image `china-cny`.
    static let chinaCny = Rswift.ImageResource(bundle: R.hostingBundle, name: "china-cny")
    /// Image `circle`.
    static let circle = Rswift.ImageResource(bundle: R.hostingBundle, name: "circle")
    /// Image `croatia-hrk`.
    static let croatiaHrk = Rswift.ImageResource(bundle: R.hostingBundle, name: "croatia-hrk")
    /// Image `czech-republic-czk`.
    static let czechRepublicCzk = Rswift.ImageResource(bundle: R.hostingBundle, name: "czech-republic-czk")
    /// Image `denmark-dkk`.
    static let denmarkDkk = Rswift.ImageResource(bundle: R.hostingBundle, name: "denmark-dkk")
    /// Image `european-union`.
    static let europeanUnion = Rswift.ImageResource(bundle: R.hostingBundle, name: "european-union")
    /// Image `frame`.
    static let frame = Rswift.ImageResource(bundle: R.hostingBundle, name: "frame")
    /// Image `hong-kong-hkd`.
    static let hongKongHkd = Rswift.ImageResource(bundle: R.hostingBundle, name: "hong-kong-hkd")
    /// Image `hungary-huf`.
    static let hungaryHuf = Rswift.ImageResource(bundle: R.hostingBundle, name: "hungary-huf")
    /// Image `iceland-isk`.
    static let icelandIsk = Rswift.ImageResource(bundle: R.hostingBundle, name: "iceland-isk")
    /// Image `india-inr`.
    static let indiaInr = Rswift.ImageResource(bundle: R.hostingBundle, name: "india-inr")
    /// Image `indonesia-idr`.
    static let indonesiaIdr = Rswift.ImageResource(bundle: R.hostingBundle, name: "indonesia-idr")
    /// Image `info`.
    static let info = Rswift.ImageResource(bundle: R.hostingBundle, name: "info")
    /// Image `israel-ils`.
    static let israelIls = Rswift.ImageResource(bundle: R.hostingBundle, name: "israel-ils")
    /// Image `japan-jpy`.
    static let japanJpy = Rswift.ImageResource(bundle: R.hostingBundle, name: "japan-jpy")
    /// Image `main_icons`.
    static let main_icons = Rswift.ImageResource(bundle: R.hostingBundle, name: "main_icons")
    /// Image `main`.
    static let main = Rswift.ImageResource(bundle: R.hostingBundle, name: "main")
    /// Image `malaysia-myr`.
    static let malaysiaMyr = Rswift.ImageResource(bundle: R.hostingBundle, name: "malaysia-myr")
    /// Image `mexico-mxn`.
    static let mexicoMxn = Rswift.ImageResource(bundle: R.hostingBundle, name: "mexico-mxn")
    /// Image `new-zealand-nzd`.
    static let newZealandNzd = Rswift.ImageResource(bundle: R.hostingBundle, name: "new-zealand-nzd")
    /// Image `norway-nok`.
    static let norwayNok = Rswift.ImageResource(bundle: R.hostingBundle, name: "norway-nok")
    /// Image `philippines-php`.
    static let philippinesPhp = Rswift.ImageResource(bundle: R.hostingBundle, name: "philippines-php")
    /// Image `republic-of-poland-pln`.
    static let republicOfPolandPln = Rswift.ImageResource(bundle: R.hostingBundle, name: "republic-of-poland-pln")
    /// Image `romania-ron`.
    static let romaniaRon = Rswift.ImageResource(bundle: R.hostingBundle, name: "romania-ron")
    /// Image `russia-rub`.
    static let russiaRub = Rswift.ImageResource(bundle: R.hostingBundle, name: "russia-rub")
    /// Image `singapore-sgd`.
    static let singaporeSgd = Rswift.ImageResource(bundle: R.hostingBundle, name: "singapore-sgd")
    /// Image `south-africa-zar`.
    static let southAfricaZar = Rswift.ImageResource(bundle: R.hostingBundle, name: "south-africa-zar")
    /// Image `south-korea-krw`.
    static let southKoreaKrw = Rswift.ImageResource(bundle: R.hostingBundle, name: "south-korea-krw")
    /// Image `sweden-sek`.
    static let swedenSek = Rswift.ImageResource(bundle: R.hostingBundle, name: "sweden-sek")
    /// Image `switzerland-chf`.
    static let switzerlandChf = Rswift.ImageResource(bundle: R.hostingBundle, name: "switzerland-chf")
    /// Image `table_view_cell`.
    static let table_view_cell = Rswift.ImageResource(bundle: R.hostingBundle, name: "table_view_cell")
    /// Image `thailand-thb`.
    static let thailandThb = Rswift.ImageResource(bundle: R.hostingBundle, name: "thailand-thb")
    /// Image `topbar`.
    static let topbar = Rswift.ImageResource(bundle: R.hostingBundle, name: "topbar")
    /// Image `turkey-try`.
    static let turkeyTry = Rswift.ImageResource(bundle: R.hostingBundle, name: "turkey-try")
    /// Image `united-kingdom-gbp`.
    static let unitedKingdomGbp = Rswift.ImageResource(bundle: R.hostingBundle, name: "united-kingdom-gbp")
    /// Image `united-states-of-america-usd`.
    static let unitedStatesOfAmericaUsd = Rswift.ImageResource(bundle: R.hostingBundle, name: "united-states-of-america-usd")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "australia-aud", bundle: ..., traitCollection: ...)`
    static func australiaAud(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.australiaAud, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "brazil-brl", bundle: ..., traitCollection: ...)`
    static func brazilBrl(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.brazilBrl, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "bulgaria-bgn", bundle: ..., traitCollection: ...)`
    static func bulgariaBgn(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.bulgariaBgn, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "canada-cad", bundle: ..., traitCollection: ...)`
    static func canadaCad(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.canadaCad, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "china-cny", bundle: ..., traitCollection: ...)`
    static func chinaCny(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.chinaCny, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "circle", bundle: ..., traitCollection: ...)`
    static func circle(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circle, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "croatia-hrk", bundle: ..., traitCollection: ...)`
    static func croatiaHrk(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.croatiaHrk, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "czech-republic-czk", bundle: ..., traitCollection: ...)`
    static func czechRepublicCzk(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.czechRepublicCzk, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "denmark-dkk", bundle: ..., traitCollection: ...)`
    static func denmarkDkk(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.denmarkDkk, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "european-union", bundle: ..., traitCollection: ...)`
    static func europeanUnion(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.europeanUnion, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "frame", bundle: ..., traitCollection: ...)`
    static func frame(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.frame, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "hong-kong-hkd", bundle: ..., traitCollection: ...)`
    static func hongKongHkd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.hongKongHkd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "hungary-huf", bundle: ..., traitCollection: ...)`
    static func hungaryHuf(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.hungaryHuf, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "iceland-isk", bundle: ..., traitCollection: ...)`
    static func icelandIsk(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icelandIsk, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "india-inr", bundle: ..., traitCollection: ...)`
    static func indiaInr(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.indiaInr, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "indonesia-idr", bundle: ..., traitCollection: ...)`
    static func indonesiaIdr(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.indonesiaIdr, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "info", bundle: ..., traitCollection: ...)`
    static func info(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.info, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "israel-ils", bundle: ..., traitCollection: ...)`
    static func israelIls(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.israelIls, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "japan-jpy", bundle: ..., traitCollection: ...)`
    static func japanJpy(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.japanJpy, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "main", bundle: ..., traitCollection: ...)`
    static func main(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.main, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "main_icons", bundle: ..., traitCollection: ...)`
    static func main_icons(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.main_icons, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "malaysia-myr", bundle: ..., traitCollection: ...)`
    static func malaysiaMyr(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.malaysiaMyr, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "mexico-mxn", bundle: ..., traitCollection: ...)`
    static func mexicoMxn(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mexicoMxn, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "new-zealand-nzd", bundle: ..., traitCollection: ...)`
    static func newZealandNzd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.newZealandNzd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "norway-nok", bundle: ..., traitCollection: ...)`
    static func norwayNok(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.norwayNok, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "philippines-php", bundle: ..., traitCollection: ...)`
    static func philippinesPhp(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.philippinesPhp, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "republic-of-poland-pln", bundle: ..., traitCollection: ...)`
    static func republicOfPolandPln(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.republicOfPolandPln, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "romania-ron", bundle: ..., traitCollection: ...)`
    static func romaniaRon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.romaniaRon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "russia-rub", bundle: ..., traitCollection: ...)`
    static func russiaRub(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.russiaRub, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "singapore-sgd", bundle: ..., traitCollection: ...)`
    static func singaporeSgd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.singaporeSgd, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "south-africa-zar", bundle: ..., traitCollection: ...)`
    static func southAfricaZar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.southAfricaZar, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "south-korea-krw", bundle: ..., traitCollection: ...)`
    static func southKoreaKrw(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.southKoreaKrw, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sweden-sek", bundle: ..., traitCollection: ...)`
    static func swedenSek(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.swedenSek, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "switzerland-chf", bundle: ..., traitCollection: ...)`
    static func switzerlandChf(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.switzerlandChf, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "table_view_cell", bundle: ..., traitCollection: ...)`
    static func table_view_cell(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.table_view_cell, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "thailand-thb", bundle: ..., traitCollection: ...)`
    static func thailandThb(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.thailandThb, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "topbar", bundle: ..., traitCollection: ...)`
    static func topbar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.topbar, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "turkey-try", bundle: ..., traitCollection: ...)`
    static func turkeyTry(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.turkeyTry, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "united-kingdom-gbp", bundle: ..., traitCollection: ...)`
    static func unitedKingdomGbp(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.unitedKingdomGbp, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "united-states-of-america-usd", bundle: ..., traitCollection: ...)`
    static func unitedStatesOfAmericaUsd(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.unitedStatesOfAmericaUsd, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `TableViewCell`.
    static let tableViewCell = _R.nib._TableViewCell()
    /// Nib `TopBar`.
    static let topBar = _R.nib._TopBar()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.tableViewCell) instead")
    static func tableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.tableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TopBar", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.topBar) instead")
    static func topBar(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.topBar)
    }
    #endif

    static func tableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TableViewCell? {
      return R.nib.tableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TableViewCell
    }

    static func topBar(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.topBar.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `tableViewCell`.
    static let tableViewCell: Rswift.ReuseIdentifier<TableViewCell> = Rswift.ReuseIdentifier(identifier: "tableViewCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _TableViewCell.validate()
      try _TopBar.validate()
    }

    struct _TableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = TableViewCell

      let bundle = R.hostingBundle
      let identifier = "tableViewCell"
      let name = "TableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> TableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? TableViewCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "european-union", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'european-union' is used in nib 'TableViewCell', but couldn't be loaded.") }
        if UIKit.UIImage(named: "republic-of-poland-pln", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'republic-of-poland-pln' is used in nib 'TableViewCell', but couldn't be loaded.") }
        if UIKit.UIImage(named: "table_view_cell", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'table_view_cell' is used in nib 'TableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    struct _TopBar: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "TopBar"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if UIKit.UIImage(named: "back", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'back' is used in nib 'TopBar', but couldn't be loaded.") }
        if UIKit.UIImage(named: "main_icons", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'main_icons' is used in nib 'TopBar', but couldn't be loaded.") }
        if UIKit.UIImage(named: "topbar", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'topbar' is used in nib 'TopBar', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try detailViewController.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try mainViewController.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct detailViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = DetailViewController

      let bundle = R.hostingBundle
      let detailViewController = StoryboardViewControllerResource<DetailViewController>(identifier: "DetailViewController")
      let name = "DetailViewController"

      func detailViewController(_: Void = ()) -> DetailViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: detailViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.detailViewController().detailViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'detailViewController' could not be loaded from storyboard 'DetailViewController' as 'DetailViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct mainViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let mainViewController = StoryboardViewControllerResource<MainViewController>(identifier: "MainViewController")
      let name = "MainViewController"

      func mainViewController(_: Void = ()) -> MainViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "arrow.clockwise", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'arrow.clockwise' is used in storyboard 'MainViewController', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.mainViewController().mainViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainViewController' could not be loaded from storyboard 'MainViewController' as 'MainViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
