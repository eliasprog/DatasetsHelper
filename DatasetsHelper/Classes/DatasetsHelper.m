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

- (void)readFile: (NSString *) path ofType:(NSString *) type withHeader:(bool) containHeader {
    
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
    
    if(containHead) {
        numLines -= 1;
        startLine = 1;
    }
    
    for(int l = startLine; l < endLine; l++) {
        NSArray *lineColumns = [[linesArray objectAtIndex: l] componentsSeparatedByString:@","];
        if([lineColumns count] != numColumns){
            [NSException raise:@"Column Number Invalid" format:@"Numero de colunas invalido"];
        }
        
        [data addObject: lineColumns];
    }
    
    _dataset = data;
}

- (void)printDataset {
    for(int l = 0; l < [_dataset count]; l++) {
        for(int c = 0; c < [_dataset[0] count]; c++) {
            NSLog(@"%@", _dataset[l][c]);
        }
    }
}

@end
