//
//  DSHViewController.m
//  DatasetsHelper
//
//  Created by Elias Ferreira on 07/22/2021.
//  Copyright (c) 2021 Elias Ferreira. All rights reserved.
//

#import "DSHViewController.h"
#include "math.h"
@import DatasetsHelper;

@interface DSHViewController ()

@end

@implementation DSHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DatasetsHelper *datasetsHelper = [[DatasetsHelper alloc]init];
    
    [datasetsHelper readFile: @"File" ofType: @"txt" withHeader: true columnTypes: @[@"float", @"float", @"float", @"float", @"string"]];
    //datasetsHelper.printDataset;
    //[datasetsHelper printDataset];
    
    NSArray * dataset = [datasetsHelper getDataset];
    
    NSLog(@"%@", dataset[2][1]);
    
    
    
    [self knn:dataset withK:2 newValue: @[@4, @2, @3, @4] ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)knn: (NSArray *) dataset withK: (int) k newValue: (NSArray *) newValue{
    
    float bestDistances[k];
    NSArray * bestDistancesLabel ;
    
    for (int i = 0; i < k; i++) {
        bestDistances[i] = INFINITY;
    }
    
    if([dataset count] - 1 != [newValue count]) {
        return;
    }
    
    NSMutableArray * results = [[NSMutableArray alloc] init];
    
    for(int l = 0; l < [dataset[0] count]; l++){
        
        float sum = 0;
        
        
        for(int c = 0; c < [dataset count] - 1; c++){
            float pos = [dataset[c][l] floatValue];
            float newPos = [newValue[c] floatValue];
            float square = (pos - newPos) * (pos - newPos);
            sum+=square;
        }
        
        float distance = sqrt(sum);
        
        // ---- Pegar menor valor de distancia salvo
        float biggerDistance = bestDistances[0];
        int biggerDistancePos = 0;
        
        for (int i = 0; i < k; i++) {
            if(bestDistances[i] >= biggerDistance) {
                biggerDistance = bestDistances[i];
                biggerDistancePos = i;
            }
        }
        // ----
        
        if(distance < biggerDistance) {
            bestDistances[biggerDistancePos] = distance;
            //To-do: preencher label
        }
        
        
        
        NSLog(@"%f, ", distance);
    }
    
    NSLog(@"Melhores distancias");
    
    for (int i = 0; i < k; i++) {
        NSLog(@"%f, ", bestDistances[i]);
    }
    
    
    
}

@end
