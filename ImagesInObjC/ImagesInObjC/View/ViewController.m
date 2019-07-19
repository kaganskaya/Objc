//
//  ViewController.m
//  ImagesInObjC
//
//  Created by Elizaveta Kaganskaya on 7/18/19.
//  Copyright © 2019 Elizaveta Kaganskaya. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "NetworkService.h"
#import "Photo.h"
#import "MyCell.h"
#import "ImageView.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) CGSize collectionViewRowSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
   
}

- (void)getData {
    NetworkService * network = [[NetworkService alloc] init];
    [network getPhotos:^(NSMutableArray<Photo *> *photos) {
       // Photo *photo = (Photo *) photos.firstObject;
        self->_photosUrls = photos;
        dispatch_async(dispatch_get_main_queue(), ^{
             [self->_collectionView reloadData];
        });
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MyCell *photoCell = (MyCell *) cell;
    [photoCell.photoImageView downloadImageFromString:self.photosUrls[indexPath.row].imageUrl];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self -> _photosUrls.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    _collectionViewRowSize = self.collectionView.bounds.size;
    _collectionViewRowSize.width = _collectionViewRowSize.width/3.2;
    _collectionViewRowSize.height = _collectionViewRowSize.width;
    return _collectionViewRowSize;
}

@end