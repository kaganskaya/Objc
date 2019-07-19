//
//  ViewController.h
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/18/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
@interface ViewController : UIViewController
@property (nonatomic, strong) NSMutableArray<Photo *> *photosUrls;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic, nullable) IBOutlet UICollectionView *collectionView;

- (void)getData;
- (void)getQueryData:(NSString *)query;
@end

