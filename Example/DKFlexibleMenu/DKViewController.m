//
//  DKViewController.m
//  DKFlexibleMenu
//
//  Created by drinking on 11/02/2015.
//  Copyright (c) 2015 drinking. All rights reserved.
//

#import <DKFlexibleMenu/DKFlexibleMenuItem.h>
#import <DKFlexibleMenu/DKFlexibleMenu.h>
#import "DKViewController.h"

#define RGB(r, g, b)           [UIColor colorWithRed: r / 255.0 green: g / 255.0 blue: b / 255.0 alpha: 1.0]

@interface DKViewController ()
@property(nonatomic, assign) BOOL menuStyleSwith;
@end

@implementation DKViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = RGB(70, 68, 78);
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
    _menuStyleSwith = YES;

}

- (void)tapped:(UITapGestureRecognizer *)gesture {

    CGPoint point = [gesture locationInView:self.view];
    [self showMenuInView:self.view AtPoint:point];
}


- (void)showMenuInView:(UIView *)view AtPoint:(CGPoint)point {

    if (self.menuStyleSwith) {
        [self showFixedMenuInView:view AtPoint:point];
    } else {
        [self showFlexibleMenuInView:view AtPoint:point];
    }

}

- (void)showFlexibleMenuInView:(UIView *)view AtPoint:(CGPoint)point {


    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:10];

    for (int i = 0; i < 18; ++i) {
        DKFlexibleMenuItem *item = [[DKFlexibleMenuItem alloc] initWithTitle:@"Copy"
                                                                       Image:[UIImage imageNamed:@"copy_24"]];
        item.backgroundColor = [self randomColor];
        [items addObject:item];
    }

    DKFlexibleMenu *menu = [[DKFlexibleMenu alloc] initWithFrame:view.bounds MenuItems:items];
    menu.menuItemSelectedBlock = ^(DKFlexibleMenuItem *item) {
        self.menuStyleSwith = YES;
    };

    [menu showInView:view AtPoint:point];

}

- (void)showFixedMenuInView:(UIView *)view AtPoint:(CGPoint)point {

    DKFlexibleMenuItem *shareItem = [[DKFlexibleMenuItem alloc] initWithTitle:@"Copy"
                                                                        Image:[UIImage imageNamed:@"copy_24"]];
    shareItem.backgroundColor = RGB(254, 115, 123);
    shareItem.positionCode = 3;

    DKFlexibleMenuItem *recommendItem = [[DKFlexibleMenuItem alloc] initWithTitle:@"Alarm"
                                                                            Image:[UIImage imageNamed:@"alarm_24"]];

    recommendItem.backgroundColor = RGB(148, 204, 106);
    recommendItem.positionCode = 2;
    DKFlexibleMenuItem *deleteItem = [[DKFlexibleMenuItem alloc] initWithTitle:@"Delete"
                                                                         Image:[UIImage imageNamed:@"delete_24"]];

    deleteItem.backgroundColor = RGB(233, 200, 80);
    deleteItem.positionCode = 4;

    DKFlexibleMenuItem *flexibleItem = [[DKFlexibleMenuItem alloc] initWithTitle:@"Flexible"
                                                                           Image:[UIImage imageNamed:@"checkmark_24"]];
    flexibleItem.backgroundColor = RGB(118, 209, 207);
    flexibleItem.positionCode = 1;

    DKFlexibleMenuItem *imageItem = [[DKFlexibleMenuItem alloc] initWithTitle:@"Game"
                                                                        Image:[UIImage imageNamed:@"globe_24"]];
    imageItem.backgroundImage = [UIImage imageNamed:@"bg1"];
    imageItem.positionCode = 5;

    DKFlexibleMenuItem *imageItem2 = [[DKFlexibleMenuItem alloc] initWithTitle:@"Photo"
                                                                         Image:[UIImage imageNamed:@"photo_24"]];
    imageItem2.backgroundImage = [UIImage imageNamed:@"bg2"];
    imageItem2.positionCode = 6;

    DKFlexibleMenu *menu = [[DKFlexibleMenu alloc] initWithFrame:view.bounds MenuItems:@[shareItem, recommendItem, flexibleItem, deleteItem, imageItem, imageItem2]];

    menu.menuItemSelectedBlock = ^(DKFlexibleMenuItem *item) {
        if (item == flexibleItem) {
            self.menuStyleSwith = NO;
        }
    };

    [menu showInView:view AtPoint:point];

}

- (UIColor *)randomColor {
    CGFloat hue = (arc4random() % 256 / 256.0);  //  0.0 to 1.0
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

@end
