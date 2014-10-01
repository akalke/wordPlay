//
//  EnterNameViewController.m
//  wordPlay
//
//  Created by Amaeya Kalke on 9/30/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "EnterNameViewController.h"
#import "EnterActionViewController.h"

@interface EnterNameViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EnterNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)performSegue sender:(id)sender{
    NSLog(@"Name Text Field: %@", self.nameTextField.text);

    if([[self.nameTextField text] isEqualToString:@""]){
        return NO;
    }
    else{
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    //Setting up desintation VC and pass parameter of appropriate segue in
    EnterActionViewController *actionViewController = segue.destinationViewController;
    actionViewController.title = [sender currentTitle];

    //Set variable values within Action VC
    actionViewController.name = [self.nameTextField text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
