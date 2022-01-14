//
//  UIView+IBDesignable.h
//  test
//
//  Created by Lucas on 1/13/22.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (IBDesignable)

@property (nonatomic, assign) IBInspectable BOOL shouldRasterize;
@property (nonatomic, assign) IBInspectable BOOL masksToBounds;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;

@end


IB_DESIGNABLE
@interface UILabel (IBDesignable)

@property (nonatomic, assign) IBInspectable CGFloat paragraphLineHeight;

@end
