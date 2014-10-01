//
//  ResultsViewControllerViewController.m
//  wordPlay
//
//  Created by Amaeya Kalke on 9/30/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ResultsViewControllerViewController.h"
#import "EnterAdjectiveViewController.h"

@interface ResultsViewControllerViewController ()
@property (strong, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ResultsViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.


    //In the ResultsViewController, bold any of the words that user has entered using NSAttributedStrings
    //hint: Use a NSMutableString and set that to the resultsTextView's attributedText property


    //Set font to system font and bold
    UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];

    //Declare and initialize mutable strings that can take an attribute
    NSMutableAttributedString *partOne = [[NSMutableAttributedString alloc] initWithString: @"The trip to "];
    NSMutableAttributedString *partTwo = [[NSMutableAttributedString alloc] initWithString: @" was a(n) "];
    NSMutableAttributedString *partThree = [[NSMutableAttributedString alloc] initWithString: @" vacation for "];
    NSMutableAttributedString *partFour = [[NSMutableAttributedString alloc] initWithString: @" and the family ever took because they were able to "];
    NSMutableAttributedString *nameString = [[NSMutableAttributedString alloc]initWithString: self.name];
    NSMutableAttributedString *actionString = [[NSMutableAttributedString alloc]initWithString: self.action];
    NSMutableAttributedString *locationString = [[NSMutableAttributedString alloc]initWithString: self.location];
    NSMutableAttributedString *adjectiveString = [[NSMutableAttributedString alloc]initWithString: self.adjective];

    //Define the length of each word to apply bold attribute to each word
    NSInteger nameLength = [self.name length];
    NSInteger actionLength = [self.action length];
    NSInteger locationLength = [self.location length];
    NSInteger adjectiveLength = [self.adjective length];

    //Add bold property to each word across the length of each user input word
    [nameString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,nameLength)];
    [actionString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,actionLength)];
    [locationString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,locationLength)];
    [adjectiveString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,adjectiveLength)];

    //Build paragraph
    [partOne appendAttributedString:locationString];
    [partOne appendAttributedString:partTwo];
    [partOne appendAttributedString:adjectiveString];
    [partOne appendAttributedString:partThree];
    [partOne appendAttributedString:nameString];
    [partOne appendAttributedString:partFour];
    [partOne appendAttributedString:adjectiveString];

    //Output paragraph with formatted input text to UITextField
    self.resultsTextView.attributedText = partOne;

    //Original output statement
    //self.resultsTextView.text = [NSString stringWithFormat:@"The trip to %@ was a(n) %@ vacation for %@ and the family ever took because they were able to %@", self.location, self.adjective, self.name, self.action];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
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
