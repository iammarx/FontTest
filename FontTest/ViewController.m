//
//  ViewController.m
//  FontTest
//
//  Created by Ammar on 12/12/13.
//  Copyright (c) 2013 30Million. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;
@property (nonatomic, strong) NSAttributedString * aatributedString;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.aatributedString = [[NSAttributedString alloc] initWithString:@"Mmmar Mahmoud AlAhmed welcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgs you in iOS 7 tech talk in Germany jhgjhgjhgj hjgjhgjgj jhgjhgjhg jhgjhgjhgj jhgjgj jh jhgj jhg jhj gj gjytuykjgjkgwelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgs" attributes:@{NSFontAttributeName: self.myLabel.font}];
    
    CGRect paragraphRect =
    [self.aatributedString boundingRectWithSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)
                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                 context:nil];
    
    //UILabel *sljf = [[UILabel alloc]init];
    
    
    CGFloat weidth = ceilf(paragraphRect.size.width);
    CGFloat height = ceilf(paragraphRect.size.height);
    
    self.widthConstraint = [NSLayoutConstraint constraintWithItem:self.myLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:weidth];
    self.heightConstraint = [NSLayoutConstraint constraintWithItem:self.myLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    
    [self.myLabel addConstraints:@[self.widthConstraint, self.heightConstraint]];
    
    //CGRect labelFrame = CGRectMake(self.myLabel.frame.origin.x+100, self.myLabel.frame.origin.y+100, weidth+100, height);
    self.myLabel.numberOfLines = 0;
    self.myLabel.attributedText = self.aatributedString;
    //self.myLabel.frame = labelFrame;
    //NSLog(@"The wiwerwe is %f and hweei %f ",self.myLabel.frame.size.width, self.myLabel.frame.size.height);

    //long myLong = 50000000;
    
    NSLog(@"The wie is %f and hei %f and  ",weidth,height );

    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
   // [self updateConstrains:self.view.frame.size.height];
    
    NSLog(@"The width is %f",self.view.frame.size.width);
}

-(void)updateConstrains:(CGFloat)width
{
    //self.aatributedString = [[NSAttributedString alloc] initWithString:@"Mmmar Mahmoud AlAhmed welcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgs you in iOS 7 tech talk in Germany jhgjhgjhgj hjgjhgjgj jhgjhgjhg jhgjhgjhgj jhgjgj jh jhgj jhg jhj gj gjytuykjgjkgwelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgswelcomefghfghfghgfhjghjghjfghjfghjfghjfgvdfvdfvdfvdfvdfvdfvdfvdfvfvfffffffffffffffffffffffffffffffffffffffffffffffffffffffffhjfghjghjghjfghjfghjgjghjgjgs" attributes:@{NSFontAttributeName: self.myLabel.font}];
    
    CGRect paragraphRect =
    [self.aatributedString boundingRectWithSize:CGSizeMake(480, CGFLOAT_MAX)
                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                        context:nil];
    
    
    
    CGFloat weidth = ceilf(paragraphRect.size.width);
    CGFloat height = ceilf(paragraphRect.size.height);
    
    self.widthConstraint = [NSLayoutConstraint constraintWithItem:self.myLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:weidth];
    self.heightConstraint = [NSLayoutConstraint constraintWithItem:self.myLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:Nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];
    
    //[self.myLabel addConstraints:@[self.widthConstraint, self.heightConstraint]];
    
    //CGRect labelFrame = CGRectMake(self.myLabel.frame.origin.x+100, self.myLabel.frame.origin.y+100, weidth+100, height);
   // self.myLabel.numberOfLines = 0;
   // self.myLabel.attributedText = self.aatributedString;
    //self.myLabel.frame = labelFrame;
    //NSLog(@"The wiwerwe is %f and hweei %f ",self.myLabel.frame.size.width, self.myLabel.frame.size.height);
    
    //long myLong = 50000000;
    
    NSLog(@"The wie is %f and hei %f and  ",weidth,height );
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
