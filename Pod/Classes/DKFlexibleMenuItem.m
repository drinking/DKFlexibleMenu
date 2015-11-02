//
// Created by drinking on 15/7/8.
// Copyright (c) 2015 drinking. All rights reserved.
//

#import "DKFlexibleMenuItem.h"


@implementation DKFlexibleMenuItem {

}
- (instancetype)initWithTitle:(NSString *)title Image:(UIImage *)image{
    if (self = [super init]) {
        _image = image;
        _title = title;
        _radius = 25;
        _positionCode = -1;
    }

    return self;
}

- (void)hexagonMask:(UIView *)view {

    CGPoint center = view.center;
    CGFloat dx = (CGFloat) (self.radius * sqrt(3) / 2);
    CGFloat dy = self.radius / 2;

    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(center.x, center.y - self.radius)];
    [trianglePath addLineToPoint:CGPointMake(center.x - dx, center.y - dy)];
    [trianglePath addLineToPoint:CGPointMake(center.x - dx, center.y + dy)];
    [trianglePath addLineToPoint:CGPointMake(center.x, center.y + self.radius)];
    [trianglePath addLineToPoint:CGPointMake(center.x + dx, center.y + dy)];
    [trianglePath addLineToPoint:CGPointMake(center.x + dx, center.y - dy)];
    [trianglePath addLineToPoint:CGPointMake(center.x, center.y - self.radius)];
    [trianglePath closePath];

    CAShapeLayer *triangleMaskLayer = [CAShapeLayer layer];
    [triangleMaskLayer setPath:trianglePath.CGPath];
    view.layer.mask = triangleMaskLayer;
}

- (UIView *)buildMenuItemView {
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.userInteractionEnabled = YES;
    [view setImage:self.backgroundImage];
    view.backgroundColor = self.backgroundColor;

    UIImageView *iv = [[UIImageView alloc] initWithImage:self.image];
    CGFloat dimension = 18;
    CGFloat offsetY = 7;
    iv.frame = CGRectMake(0, 0, dimension, dimension);
    iv.center = CGPointMake(view.center.x, view.center.y - offsetY);
    [view addSubview:iv];


    CGFloat labelOffsetY = 8;
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:10];
    label.textColor = [UIColor whiteColor];
    label.text = self.title;
    [label sizeToFit];
    label.center = CGPointMake(view.center.x, view.center.y + labelOffsetY);
    [view addSubview:label];

    [self hexagonMask:view];
    return view;
}

@end