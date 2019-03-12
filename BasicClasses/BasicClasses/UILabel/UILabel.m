//
//  UILabel.m
//  BasicClasses
//
//  Created by haoxuezhi on 2019/1/24.
//  Copyright © 2019年 杨维. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIView.h>
#import <UIKit/UIStringDrawing.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIContentSizeCategoryAdjusting.h>

NS_ASSUME_NONNULL_BEGIN


@class UIColor, UIFont;

NS_CLASS_AVAILABLE_IOS(2_0) @interface UILabelDemo : UIView <NSCoding, UIContentSizeCategoryAdjusting>

@property(nullable, nonatomic,copy)   NSString           *text;            // default is nil
@property(null_resettable, nonatomic,strong) UIFont      *font;            // default is nil (system font 17 plain)
@property(null_resettable, nonatomic,strong) UIColor     *textColor;       // default is nil (text draws black)
@property(nullable, nonatomic,strong) UIColor            *shadowColor;     // default is nil (no shadow)
@property(nonatomic)        CGSize             shadowOffset;    // default is CGSizeMake(0, -1) -- a top shadow
@property(nonatomic)        NSTextAlignment    textAlignment;   // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
@property(nonatomic)        NSLineBreakMode    lineBreakMode;   // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text

// the underlying attributed string drawn by the label, if set, the label ignores the properties above.
@property(nullable, nonatomic,copy)   NSAttributedString *attributedText NS_AVAILABLE_IOS(6_0);  // default is nil

// the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property

@property(nullable, nonatomic,strong)               UIColor *highlightedTextColor; // default is nil
@property(nonatomic,getter=isHighlighted) BOOL     highlighted;          // default is NO

@property(nonatomic,getter=isUserInteractionEnabled) BOOL userInteractionEnabled;  // default is NO

//将它设置为NO将会使文本变暗，表示它未激活，此时改变它的颜色是没有任何效果的。
@property(nonatomic,getter=isEnabled)                BOOL enabled;                 // default is YES. changes how the label is drawn

// this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
// if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
// truncated using the line break mode.

@property(nonatomic) NSInteger numberOfLines;

// these next 3 properties allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
// and to specify how the text baseline moves when it needs to shrink the font.

@property(nonatomic) BOOL adjustsFontSizeToFitWidth;         // default is NO

//    baselineAdjustment：如果adjustsFontSizeToFitWidth属性设置为YES，numberOfLines=1行的时候有效，这个属性就来控制文本基线的行为
//
//    UIBaselineAdjustmentAlignBaselines=0，默认，文本最上端与中线对齐。
//    UIBaselineAdjustmentAlignCenters,   文本中线与label中线对齐。
//    UIBaselineAdjustmentNone,  文本最低端与label中线对齐。
@property(nonatomic) UIBaselineAdjustment baselineAdjustment; // default is UIBaselineAdjustmentAlignBaselines
@property(nonatomic) CGFloat minimumScaleFactor NS_AVAILABLE_IOS(6_0); // default is 0.0


// Tightens inter-character spacing in attempt to fit lines wider than the available space if the line break mode is one of the truncation modes before starting to truncate.
// The maximum amount of tightening performed is determined by the system based on contexts such as font, line width, etc.
@property(nonatomic) BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE_IOS(9_0); // default is NO

// override points. can adjust rect before calling super.
// label has default content mode of UIViewContentModeRedraw

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;
- (void)drawTextInRect:(CGRect)rect;


// Support for constraint-based layout (auto layout)
// If nonzero, this is used when determining -intrinsicContentSize for multiline labels
@property(nonatomic) CGFloat preferredMaxLayoutWidth NS_AVAILABLE_IOS(6_0);


// If YES, the UILabel will scroll its text while any of its immediate or distant superviews become focused. Also, lineBreakMode, adjustsFontSizeToFitWidth, and allowsDefaultTighteningForTruncation are ignored.
@property (nonatomic) BOOL enablesMarqueeWhenAncestorFocused API_AVAILABLE(tvos(12.0)) API_UNAVAILABLE(ios, watchos);


// deprecated:

@property(nonatomic) CGFloat minimumFontSize NS_DEPRECATED_IOS(2_0, 6_0) __TVOS_PROHIBITED; // deprecated - use minimumScaleFactor. default is 0.0

// Non-functional.  Hand tune by using NSKernAttributeName to affect tracking, or consider using the allowsDefaultTighteningForTruncation property.
@property(nonatomic) BOOL adjustsLetterSpacingToFitWidth NS_DEPRECATED_IOS(6_0,7_0) __TVOS_PROHIBITED;

@end

NS_ASSUME_NONNULL_END
