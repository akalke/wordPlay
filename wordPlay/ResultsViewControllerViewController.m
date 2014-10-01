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

    //SET FONT FORMAT
    //Set font style for user input words. In this case, we are looking at the bold version of the system font
    UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];


    //BUILD PARAGRAPH STRINGS
    //Declare and initialize mutable strings that can take an attribute
    NSMutableAttributedString *nameString = [[NSMutableAttributedString alloc]initWithString: self.name];
    NSMutableAttributedString *actionString = [[NSMutableAttributedString alloc]initWithString: self.action];
    NSMutableAttributedString *locationString = [[NSMutableAttributedString alloc]initWithString: self.location];
    NSMutableAttributedString *adjectiveString = [[NSMutableAttributedString alloc]initWithString: self.adjective];


    //CONTINUE BUILDING PARAGRAPH STRINGS
    //Need to build the static portions of the mad lib by using another set of mutable attributed strings. There is no
    //way to pull the attributed strings into the traditional self.<UIObject>.text because this format will strip the
    //format from the string
    NSMutableAttributedString *partOne = [[NSMutableAttributedString alloc] initWithString: @"The trip to "];
    NSMutableAttributedString *partTwo = [[NSMutableAttributedString alloc] initWithString: @" was a(n) "];
    NSMutableAttributedString *partThree = [[NSMutableAttributedString alloc] initWithString: @" vacation for "];
    NSMutableAttributedString *partFour = [[NSMutableAttributedString alloc] initWithString: @" and the family ever took because they were able to "];


    //IDENTIFY RANGE
    //Define the length of each word to apply bold attribute to each word
    NSInteger nameLength = [self.name length];
    NSInteger actionLength = [self.action length];
    NSInteger locationLength = [self.location length];
    NSInteger adjectiveLength = [self.adjective length];


    //APPLY FONT FORMAT
    //Add bold property to each word across the length of each user input word
    [nameString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,nameLength)];
    [actionString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,actionLength)];
    [locationString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,locationLength)];
    [adjectiveString addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0,adjectiveLength)];


    //BUILD PARAGRAPH
    //Append each individual string noted above to produce a final paragraph. In this case, we are building on top
    //of partOne. Manual concatenation using the append method for attributed strings.
    [partOne appendAttributedString:locationString];
    [partOne appendAttributedString:partTwo];
    [partOne appendAttributedString:adjectiveString];
    [partOne appendAttributedString:partThree];
    [partOne appendAttributedString:nameString];
    [partOne appendAttributedString:partFour];
    [partOne appendAttributedString:adjectiveString];


    //OUTPUT PARAGRAPH
    //Output paragraph with formatted input text to UITextField
    self.resultsTextView.attributedText = partOne;


    //ORIGINAL OUTPUT
    //Unformatted version of the output leveraging typical object references %@ and variable names
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
