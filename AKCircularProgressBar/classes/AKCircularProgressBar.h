//
//  AKCircularProgressBar.h
//  AKCircularProgressBar
//
//  Created by Aikong on 8/31/2557 BE.
//  Copyright (c) 2557 Mongkol Munglarkthum. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    AKCircularProgressBarSimpleStyl
}AKCircularProgressBarStyle;

@interface AKCircularProgressBar : UIView

@property (nonatomic) float progress;
@property (nonatomic) NSString * text;
//@property (nonatomic) AKCircularProgressBarStyle style;
@property (nonatomic,strong) UIColor * tintColor;


@end
