//
//  ViewController.h
//  MyRadio
//
//  Created by Cuong Pham on 5/17/14.
//  Copyright (c) 2014 SSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *channelTitle;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableData *responseData;

@property (strong, nonatomic) NSURLConnection *connection;
@end
