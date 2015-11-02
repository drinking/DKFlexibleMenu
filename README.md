# DKFlexibleMenu


##Screenshot
![screenshot1](https://raw.githubusercontent.com/drinking/DKFlexibleMenu/master/screenshot/preview.gif)

## Description
A flexible menu which displays several hexagon menu items around the touch point.It will calculate whether each menu item is visible and show them at the proper place.
## Usage

Just as other popup menu, you just need setup menu items and show it up.

````ObjC
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

````


## Installation

**CocoaPods**

DKFlexibleMenu is available through [CocoaPods](http://cocoapods.org).

To install add the following line to your Podfile:

    pod 'DKFlexibleMenu'


## Author

drinking, pan49@126.com

## License

DKFlexibleMenu is available under the MIT license. See the LICENSE file for more info.
