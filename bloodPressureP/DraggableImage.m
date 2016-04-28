//
//  UIImage+Draggable.m
//  bloodPressureP
//
//  Created by Adriana Elizondo on 4/26/16.
//  Copyright © 2016 Adriana Elizondo. All rights reserved.
//

#import "DraggableImage.h"

@implementation DraggableImage{
    float yDis;
    float xDis;
}

-(void)awakeFromNib{
    UIPinchGestureRecognizer * pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(detectPinch:)];
    [self addGestureRecognizer:pinchRecognizer];
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    // Retrieve the touch point
    CGPoint pt = [[touches anyObject] locationInView:self];
    startLocation = pt;
    [[self superview] bringSubviewToFront:self];
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    // Move relative to the original touch point
    CGPoint pt = [[touches anyObject] locationInView:self];
    CGRect frame = [self frame];
    frame.origin.x += pt.x - startLocation.x;
    frame.origin.y += pt.y - startLocation.y;
    [self setFrame:frame];
}

- (void) detectPinch:(UIPinchGestureRecognizer *)gestureRecognizer{
    if ([gestureRecognizer numberOfTouches] >1) {
        
        //getting width and height between gestureCenter and one of my finger
        float x = [gestureRecognizer locationInView:self].x - [gestureRecognizer locationOfTouch:1 inView:self].x;
        if (x<0) {
            x *= -1;
        }
        float y = [gestureRecognizer locationInView:self].y - [gestureRecognizer locationOfTouch:1 inView:self].y;
        if (y<0) {
            y *= -1;
        }
        
        //set Border
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            xDis = self.bounds.size.width - x*2;
            yDis = self.bounds.size.height - y*2;
        }
        
        //double size cause x and y is just the way from the middle to my finger
        float width = x*2+xDis;
        if (width < 1) {
            width = 1;
        }
        float height = y*2+yDis;
        if (height < 1) {
            height = 1;
        }
        
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
    }
}
@end
