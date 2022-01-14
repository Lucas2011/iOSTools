//
//  UIView+IBDesignable.m
//  test
//
//  Created by Lucas on 1/13/22.
//  Copyright (c) 2015 Happy Santa. All rights reserved.
//


#import "UIView+IBDesignable.h"

@implementation UIView (IBDesignable)

- (BOOL)shouldRasterize {
    return self.layer.shouldRasterize;
}

- (void)setShouldRasterize:(BOOL)layerShouldRasterize {
    self.layer.shouldRasterize = layerShouldRasterize;
    if (layerShouldRasterize) {
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
}

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}

- (void)setMasksToBounds:(BOOL)layerMasksToBounds {
    self.layer.masksToBounds = layerMasksToBounds;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)layerCornerRadius {
    self.layer.cornerRadius = layerCornerRadius;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)layerBorderWidth {
    self.layer.borderWidth = layerBorderWidth;
}

#pragma mark - Shadow

- (UIColor *)shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setShadowColor:(UIColor *)layerShadowColor {
    self.layer.shadowColor = layerShadowColor.CGColor;
}

- (CGFloat)shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setShadowOpacity:(CGFloat)layerShadowOpacity {
    self.layer.shadowOpacity = layerShadowOpacity;
}

- (CGFloat)shadowRadius {
    return self.layer.shadowRadius;
}

- (void)setShadowRadius:(CGFloat)layerShadowRadius {
    self.layer.shadowRadius = layerShadowRadius;
}

- (CGSize)shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setShadowOffset:(CGSize)layerShadowOffset {
    self.layer.shadowOffset = layerShadowOffset;
}

@end


@implementation UILabel (IBDesignable)

- (CGFloat)paragraphLineHeight {
    NSParagraphStyle *paragraph = [self.attributedText attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:NULL];
    UIFont *font = [self.attributedText attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];
    return paragraph.lineHeightMultiple * font.pointSize;
}

- (void)setParagraphLineHeight:(CGFloat)paragraphLineHeight {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableParagraphStyle *paragraph = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraph.lineHeightMultiple = paragraphLineHeight / self.font.pointSize;
        paragraph.alignment = self.textAlignment;
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:@{
            NSFontAttributeName : self.font,
            NSForegroundColorAttributeName : self.textColor,
            NSParagraphStyleAttributeName : paragraph,
        }];
    });
}

@end
