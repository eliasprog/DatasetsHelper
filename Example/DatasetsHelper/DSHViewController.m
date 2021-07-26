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
    
    [datasetsHelper readFile: @"File" ofType: @"txt" withHeader: true columnTypes: @[@"string", @"float", @"string", @"int"]];
    datasetsHelper.printDataset;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
