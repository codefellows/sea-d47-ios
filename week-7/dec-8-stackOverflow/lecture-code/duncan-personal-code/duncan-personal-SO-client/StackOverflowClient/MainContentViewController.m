//
//  MainContentViewController.m
//  StackOverflowClient
//
//  Created by Adam Wallraff on 12/1/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

#import "MainContentViewController.h"
#import "SOSearchAPIService.h"
#import "SOSearchJSONParser.h"
#import "Question.h"
#import "SearchResultTableViewCell.h"


@interface MainContentViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (strong, nonatomic) NSArray<Question*> *Questions;

@end

@implementation MainContentViewController

-(void) setQuestions:(NSArray *)Questions{
    _Questions = Questions;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMainViewController];
}

-(void) setupMainViewController {
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.searchBar setDelegate:self];
    
    
    [self fetchResultsForSearchTearm:@"hello world"];
    
    UINib *nib = [UINib nibWithNibName:@"SearchResultTableViewCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"SearchResultCell"];
    
    
}

-(void) fetchResultsForSearchTearm:(NSString*)searchTerm {
    
    [SOSearchAPIService searchSimilarWithTearm:searchTerm pageNumber:0 withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        if (error == nil){
            NSLog(@"Success Requesting SOSearchAPIService SOSearchAPIService*");
            [SOSearchJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
                if (error == nil && data != nil) {
                    NSLog(@"\n\nSuccess Parsing SearchGetRequest\n");
                    [self setQuestions:data];
                    return;
                }
                NSLog(@"Failure ParsingSOSearchJSONParser questionsArrayFromDictionary");
                NSLog(@"%@\n\n", error.description);
            }];
            return;
        }
        NSLog(@"Failure Requesting SOSearchAPIService SOSearchAPIService*\n\n");
        NSLog(@"%@\n\n", error.description);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.Questions != nil){
        return self.Questions.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchResultTableViewCell *cell = (SearchResultTableViewCell*) [self.tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];
    
    cell.question = [self.Questions objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self fetchResultsForSearchTearm: self.searchBar.text];
}

@end
