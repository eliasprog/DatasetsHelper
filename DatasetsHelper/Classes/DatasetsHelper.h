//
//  DatasetsHelper.h
//  DatasetsHelper
//
//  Created by Elias Ferreira on 22/07/21.
//

#ifndef DatasetsHelper_h
#define DatasetsHelper_h


#endif /* DatasetsHelper_h */

@interface DatasetsHelper : NSObject
- (void)sayHello;
- (void)readFile: (NSString *) path ofType:(NSString *) type withHeader:(bool) containHeader columnTypes: (NSArray*) columnTypes;
- (void)printDataset;
- (NSArray *) getDataset;
@property(nonatomic, strong) NSMutableArray *dataset;
@property(nonatomic, strong) NSArray *header;
@property(nonatomic, strong) NSArray * types;
//@property NSNumber *num;
@end
