//
//  EnterAdjectiveViewController.m
//  wordPlay
//
//  Created by Amaeya Kalke on 9/30/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "EnterAdjectiveViewController.h"
#import "ResultsViewControllerViewController.h"

@interface EnterAdjectiveViewController ()
@property (strong, nonatomic) IBOutlet UITextField *adjectiveTextField;
@end

@implementation EnterAdjectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)performSegue sender:(id)sender{
    if([[self.adjectiveTextField text] isEqualToString:@""]){
        return NO;
    }
    else{
        return YES;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //Setting up desintation VC and pass parameter of appropriate segue in
    ResultsViewControllerViewController *resultsViewController = segue.destinationViewController;
    resultsViewController.title = [sender currentTitle];

    //Set variable values within Results VC
    resultsViewController.adjective = [self.adjectiveTextField text];
    resultsViewController.name = self.name;
    resultsViewController.location = self.location;
    resultsViewController.action = self.action;
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
