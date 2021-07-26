//
//  DatasetsHelper.m
//  DatasetsHelper
//
//  Created by Elias Ferreira on 22/07/21.
//

#import <Foundation/Foundation.h>
#import "DatasetsHelper.h"

@implementation DatasetsHelper


- (void)sayHello {
    NSLog(@"Hello World");
}

- (void)readFile: (NSString *) path ofType:(NSString *) type withHeader:(bool) containHeader columnTypes: (NSArray*) columnTypes  {
    
    NSMutableArray *data = [NSMutableArray new];
    bool containHead = containHeader;
    NSString *filepath = [[NSBundle mainBundle] pathForResource: path ofType: type];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error){
        [NSException raise:@"File Error" format:@"Erro na leitura do arquivo: %@", error.localizedDescription];
    }
    
    NSArray *linesArray = [fileContents componentsSeparatedByString: @"\n"];
    unsigned long numLines = [linesArray count];
    unsigned long numColumns = [[[linesArray firstObject] componentsSeparatedByString:@","] count];
    int startLine = 0;
    unsigned long int endLine = numLines;
    
    if(numColumns != [columnTypes count]) {
        [NSException raise:@"Invalid Data Types" format:@"Tipos de dados inválidoss"];
    }
    
    if(containHead) {
        numLines -= 1;
        startLine = 1;
    }
    
    NSArray *stringsData[numLines][numColumns];
    
    for(int l = startLine; l < endLine; l++) {
        NSArray *lineColumns = [[linesArray objectAtIndex: l] componentsSeparatedByString:@","];
        if([lineColumns count] != numColumns){
            [NSException raise:@"Column Number Invalid" format:@"Numero de colunas invalido"];
        }
        
        for(int c = 0; c < numColumns; c++) {
            stringsData[(containHead ? l-1 : l)][c] = lineColumns[c];
        }
    }
    
    // Mount DataSet
    for(int c = 0; c < numColumns; c++){
        
        NSMutableArray *col = [NSMutableArray new];
        
        for(int l = 0; l < numLines; l++){
            NSString *posString = stringsData[l][c];
            
            if([columnTypes[c]  isEqual: @"float"]) {
                NSNumber *vFloat = @([posString floatValue]);
                [col addObject: vFloat];
            }
            else if([columnTypes[c]  isEqual: @"int"]){
                NSNumber *vInt = @([posString integerValue]);
                [col addObject: vInt];
            }
            
            else if([columnTypes[c]  isEqual: @"string"]){
                NSString *vString = posString;
                [col addObject: vString];
            }
            else {
                NSString *vString2 = posString;
                [col addObject: vString2];
            }
        }
        [data addObject: col];
    }
    _dataset = data;
}

- (void)printDataset {
    for(int l = 0; l < [_dataset count]; l++) {
        for(int c = 0; c < [_dataset[0] count]; c++) {
            NSLog(@"%@", _dataset[l][c] );
        }
    }
}

@end
