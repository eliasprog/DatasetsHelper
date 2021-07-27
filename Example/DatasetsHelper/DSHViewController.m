//
//  DSHViewController.m
//  DatasetsHelper
//
//  Created by Elias Ferreira on 07/22/2021.
//  Copyright (c) 2021 Elias Ferreira. All rights reserved.
//

#import "DSHViewController.h"
@import DatasetsHelper;

@interface DSHViewController ()

@end

@implementation DSHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DatasetsHelper *datasetsHelper = [[DatasetsHelper alloc]init];
    
    [datasetsHelper readFile: @"File" ofType: @"txt" withHeader: true columnTypes: @[@"string", @"string", @"string", @"string"]];
    //datasetsHelper.printDataset;
    [datasetsHelper printDataset];
    
    NSArray * dataset = [datasetsHelper getDataset];
    
    NSLog(@"%@", dataset[2][1]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
