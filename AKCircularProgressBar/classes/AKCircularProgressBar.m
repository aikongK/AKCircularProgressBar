//
//  AKCircularProgressBar.m
//  AKCircularProgressBar
//
//  Created by Aikong on 8/31/2557 BE.
//  Copyright (c) 2557 Mongkol Munglarkthum. All rights reserved.
//

#import "AKCircularProgressBar.h"

@interface AKCircularProgressBarBackground : UIView
{
    CGFloat start;
    CGFloat end;
}
@property (nonatomic,strong) UIColor * tintColor;
@end

@interface AKCircularProgressBar (){
    CGFloat start;
    CGFloat end;
}
@property AKCircularProgressBarBackground * barBackground;
@property UILabel * label;

@end

@implementation AKCircularProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // Initialization code
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib{
    [self setUp];
}

-(void)setUp{
    start = M_PI * 1.5;
    end = start + (M_PI * 2);
    _barBackground = [[AKCircularProgressBarBackground alloc] initWithFrame:self.bounds];
    _barBackground.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    UIFont *font = [UIFont fontWithName: @"Helvetica-Bold" size: self.bounds.size.height/10] ;
    [_label setFont:font];
    [_label setTextAlignment:NSTextAlignmentCenter];
    _label.center = self.center;
    [self addSubview:_label];
    [self addSubview:_barBackground];

}

-(void)setProgress:(float)progress{
    if (progress>1.0) {
        progress = 1.0;
    }else if (progress < 0){
        progress = 0;
    }
    _progress = progress;
}

-(void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    [_barBackground setTintColor:_tintColor];
    [_barBackground setNeedsDisplay];
    [_label setTextColor:_tintColor];
}
- (void)drawRect:(CGRect)rect
{
    // Create our path
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:rect.size.width / 2 -rect.size.width/10
                      startAngle: end - ((end - start)*_progress)
                        endAngle: end
                       clockwise:YES];
 
    // Set the width and stroke 
    bezierPath.lineWidth = rect.size.width/10 * 0.7;
    if (_tintColor) {
        [_tintColor setStroke];
    }else{
        [[UIColor blueColor] setStroke];
    }
    [bezierPath stroke];
    
    // Text Drawing
    if (_text) {
        [_label setText:_text];
//        CGRect textRect = CGRectMake(0+rect.size.width/10, (rect.size.height / 2.0) - 45/2.0, self.frame.size.width - rect.size.width/5, 45);
//        
//        [[UIColor blackColor] setFill];
//        UIFont *font = [UIFont fontWithName: @"Helvetica-Bold" size: 26.5] ;
//        
//        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//        paragraph.alignment = NSTextAlignmentCenter;
//        
//        NSDictionary* attributes = @{
//                                     NSParagraphStyleAttributeName : paragraph,
//                                     NSFontAttributeName : font,
//                                     NSForegroundColorAttributeName : _tintColor
//                                     };
//        [_text drawInRect:textRect withAttributes:attributes];
    }
    
   
}



@end

@implementation AKCircularProgressBarBackground

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        start = M_PI * 1.5;
        end = start + (M_PI * 2);
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath * borderpath = [UIBezierPath bezierPath];
    borderpath.lineWidth = rect.size.width/10;
    [borderpath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2) radius:rect.size.width / 2 -rect.size.width/10 startAngle:start endAngle:end clockwise:YES];
    
    UIColor * backgroundColor = [_tintColor colorWithAlphaComponent:0.1];
    
    [backgroundColor setStroke];
    [borderpath stroke];
}

//-(void)layoutSubviews{
//    [self setNeedsDisplayInRect:self.frame];
//}

@end
