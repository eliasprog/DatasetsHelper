//
//  DatasetsHelper.m
//  DatasetsHelper
//
//  Created by Elias Ferreira on 22/07/21.
//

#import <Foundation/Foundation.h>
#import "DatasetsHelper.h"

@implementation DatasetsHelper

    //(NSNumber) *num = [NSNumber numberWithInt:10];

- (void)sayHello {
    
    for(int l = 0; l < [_dataset2 count]; l++) {
        for(int c = 0; c < [_dataset2[0] count]; c++) {
            NSLog(@"%@", _dataset2[l][c]);
        }
    }
}

- (void)readFile: (NSString *) path ofType:(NSString *) type withHeader:(bool) containHeader {
    
//    _num = [NSNumber numberWithInt:10];
    
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
    
    if(containHead) {
        numLines -= 1;
        startLine = 1;
    }
    
    NSLog(@"N de Linhas: %lu", numLines);
    NSLog(@"N de Colunas: %lu", numColumns);
    
    NSArray *dataset[numLines][numColumns];
    
    for(int l = startLine; l < endLine; l++) {
        NSArray *lineColumns = [[linesArray objectAtIndex: l] componentsSeparatedByString:@","];
        if([lineColumns count] != numColumns){
            [NSException raise:@"Column Number Invalid" format:@"Numero de colunas invalido"];
        }
        
        //[_dataset2 addObject:lineColumns];
        
        for(int c = 0; c < numColumns; c++) {
            dataset[(l - (containHead ? 1 : 0)) ][c] = [lineColumns objectAtIndex: c];
        }
    }
    
    for(int l = 0; l < numLines; l++) {
        for(int c = 0; c < numColumns; c++) {
            //NSLog(@"%@", dataset[l][c]);
        }
    }
    
}

@end
