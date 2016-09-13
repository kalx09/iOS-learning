//
//  RatingControl.m
//  FoodTrackerApp
//
//  Created by Kalpesh Jain on 9/13/16.
//  Copyright © 2016 Kalpesh Jain. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl{

    NSMutableArray *ratingButtons;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        ratingButtons=[[NSMutableArray alloc]init];
        UIImage *emptyStarImage = [UIImage imageNamed:@"emptyStar"];
        UIImage *filledStarImage = [UIImage imageNamed:@"filledStar"];
        
        for (int i=0; i<5; i++) {
            
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setUserInteractionEnabled:YES];
        
        button.frame=CGRectMake((i*(44+5)), 0, 44, 44);
            [button setImage:emptyStarImage forState:UIControlStateNormal];
            [button setImage:filledStarImage forState:UIControlStateSelected];
            [button setImage:filledStarImage forState:UIControlStateHighlighted];
            button.adjustsImageWhenHighlighted=NO;
            [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
        button.backgroundColor=[UIColor redColor];
            
        [ratingButtons addObject:button];
            
        [self addSubview:button];
    
        }
    }
    NSUInteger arrayLength = [ratingButtons count];
    NSLog(@"count: %lu", (unsigned long)arrayLength);
    return self;
}

-(void) ratingButtonTapped:(UIButton *) button{
    
    NSUInteger index=[ratingButtons indexOfObject:button];
    NSUInteger rating=index+1;
    //NSLog(@"indexOf: %lu",(unsigned long)rating);
    
    for (UIButton *button in ratingButtons) {
        button.selected=[ratingButtons indexOfObject:button]<rating;
    }
}

-(void)layoutSubviews{
    //CGRectMake(0, 0, 44, 44);
}

@end
