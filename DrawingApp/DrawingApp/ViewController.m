//
//  ViewController.m
//  DrawingApp
//
//  Created by Nawruzbek Ibragimow on 21.05.2026.
//

#import "ViewController.h"

@interface ViewController ()

@property CGPoint lastPoint;
@property BOOL swiped;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.canvas.backgroundColor = [UIColor whiteColor];
    self.canvas.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.lastPoint = [touch locationInView:self.canvas];
    self.swiped = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.swiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvas];
    
    UIGraphicsBeginImageContext(self.canvas.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.canvas.image drawInRect:CGRectMake(0, 0, self.canvas.frame.size.width, self.canvas.frame.size.height)];
    
    CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 5.0);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextStrokePath(context);
    
    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(!self.swiped) {
        UIGraphicsBeginImageContext(self.canvas.frame.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.canvas.image drawInRect:CGRectMake(0, 0, self.canvas.frame.size.width, self.canvas.frame.size.height)];
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, 5.0);
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
        CGContextMoveToPoint(context, self.lastPoint.x, self.lastPoint.y);
        CGContextAddLineToPoint(context, self.lastPoint.x, self.lastPoint.y);
        CGContextStrokePath(context);
        self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

@end
