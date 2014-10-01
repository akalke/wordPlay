//
//  EnterLocationViewController.m
//  wordPlay
//
//  Created by Amaeya Kalke on 9/30/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "EnterLocationViewController.h"
#import "EnterAdjectiveViewController.h"

@interface EnterLocationViewController ()
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;


@end

@implementation EnterLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)performSegue sender:(id)sender{
    if([[self.locationTextField text] isEqualToString:@""]){
        return NO;
    }
    else{
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    EnterAdjectiveViewController *adjectiveViewController = segue.destinationViewController;
    adjectiveViewController.title = [sender currentTitle];
    adjectiveViewController.location = [self.locationTextField text];
    adjectiveViewController.name = self.name;
    adjectiveViewController.action = self.action;
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
