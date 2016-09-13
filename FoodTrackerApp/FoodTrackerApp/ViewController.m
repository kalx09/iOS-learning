//
//  ViewController.m
//  FoodTrackerApp
//
//  Created by Kalpesh Jain on 9/12/16.
//  Copyright © 2016 Kalpesh Jain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UILabel *LabelField;
@property (weak, nonatomic) IBOutlet UIImageView *ImageViewField;
//@property (weak, nonatomic) IBOutlet RatingControl *RatingControlField;

@end

@implementation ViewController
- (IBAction)ButtonField:(id)sender {
    NSString *textField = [[self TextField] text];
    [self.LabelField setText:textField];
}
- (IBAction)GestureRecognizerField:(UITapGestureRecognizer *)sender {
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.ImageViewField.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.ImageViewField setUserInteractionEnabled:YES];
    [self.TextField setUserInteractionEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
