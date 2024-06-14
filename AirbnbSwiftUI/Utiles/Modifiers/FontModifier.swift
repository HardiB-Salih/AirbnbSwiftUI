//
//  FontModifier.swift
//  AirbnbSwiftUI
//
//  Created by HardiB.Salih on 6/14/24.
//

import SwiftUI

struct BlackFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.black)
    }
}

struct HeavyFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.heavy)
    }
}

struct SemiboldFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
    }
}

struct MediumFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.medium)
    }
}

struct RegularFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.regular)
    }
}

struct LightFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.light)
    }
}

struct ThinFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.thin)
    }
}


struct UltraLightFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.ultraLight)
    }
}


//MARK: - Font
struct FootnoteFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
    }
}

struct CaptionFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
    }
}

struct HeadlineFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
    }
}

struct SubheadlineFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
    }
}





// Add more custom modifiers as needed
extension View {
    
    func black() -> some View {
        self.modifier(BlackFontModifier())
    }
    
    func heavy() -> some View {
        self.modifier(HeavyFontModifier())
    }
    
    func semibold() -> some View {
        self.modifier(SemiboldFontModifier())
    }
    
    func medium() -> some View {
        self.modifier(MediumFontModifier())
    }
    
    func regular() -> some View {
        self.modifier(RegularFontModifier())
    }

    func light() -> some View {
        self.modifier(LightFontModifier())
    }
    
    func thin() -> some View {
        self.modifier(ThinFontModifier())
    }
    
    func ultraLight() -> some View {
        self.modifier(UltraLightFontModifier())
    }
    
    //MARK: FONT
    func footnote() -> some View {
        self.modifier(FootnoteFontModifier())
    }
    
    func caption() -> some View {
        self.modifier(CaptionFontModifier())
    }
    
    func headline() -> some View {
        self.modifier(HeadlineFontModifier())
    }
    
    
    func subheadline() -> some View {
        self.modifier(SubheadlineFontModifier())
    }
}
