//
//  EnterActionViewController.m
//  wordPlay
//
//  Created by Amaeya Kalke on 9/30/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "EnterActionViewController.h"
#import "EnterLocationViewController.h"

@interface EnterActionViewController ()
@property (strong, nonatomic) IBOutlet UITextField *actionTextField;


@end

@implementation EnterActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)performSegue sender:(id)sender{
    NSLog(@"%@", self.actionTextField.text);

    if([[self.actionTextField text] isEqualToString:@""]){
        return NO;
    }
    else{
        return YES;
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    //Setting up desintation VC and pass parameter of appropriate segue in
    EnterLocationViewController *locationViewController = segue.destinationViewController;
    locationViewController.title = [sender currentTitle];

    //Set variable values within Location VC
    locationViewController.action = [self.actionTextField text];
    locationViewController.name = self.name;
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
