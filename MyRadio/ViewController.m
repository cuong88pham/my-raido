//
//  ViewController.m
//  MyRadio
//
//  Created by Cuong Pham on 5/17/14.
//  Copyright (c) 2014 SSS. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController {

    NSArray *channels;
    
}

@synthesize channelTitle;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Set Static Channel
    channels = @[@[@"An Giang",@"angiang"],
                 @[@"Bắc Giang",@"bacgiang"],
                 @[@"Bắc Cạn",@"baccan"],
                 @[@"Bạc Liêu",@"baclieu"],
                 @[@"Bắc Ninh",@"bacninh"],
                 @[@"Bến Tre",@"bentre"],
                 @[@"Bình Định",@"binhdinh"],
                 @[@"Bình Dương",@"binhduong"],
                 @[@"Bình Phước",@"binhphuoc"],
                 @[@"Bình Thuận",@"binhthuan"],
                 @[@"Cà Mau",@"camau"],
                 @[@"Cần Thơ",@"cantho"],
                 @[@"Cao Bằng",@"caobang"],
                 @[@"Đà Nẵng",@"danang"],
                 @[@"Đăk LăK",@"daklak"],
                 @[@"Đăk Nông",@"daknong"],
                 @[@"Điện Biên",@"dienbien"],
                 @[@"Đồng Nai",@"dongnai"],
                 @[@"Đồng Tháp",@"dongthap"],
                 @[@"Gia Lai",@"gialai"],
                 @[@"Hà Giang",@"hagiang"],
                 @[@"Hà Nam",@"hanam"],
                 @[@"Hà Nội",@"hanoi"],
                 @[@"Hà Tĩnh",@"hatinh"],
                 @[@"Hải Dương",@"haiduong"],
                 @[@"Hải Phòng",@"haiphong"],
                 @[@"Hậu Giang",@"haugiang"],
                 @[@"Hòa Bình",@"hoabinh"],
                 @[@"Hưng Yên",@"hungyen"],
                 @[@"Khánh Hòa",@"khanhhoa"],
                 @[@"Kiên Giang",@"kiengiang"],
                 @[@"Kon Tum",@"kontum"],
                 @[@"Lai Châu",@"laichau"],
                 @[@"Lâm Đồng",@"lamdong"],
                 @[@"Lạng Sơn",@"langson"],
                 @[@"Lào Cai",@"laocai"],
                 @[@"Long An",@"longan"],
                 @[@"Nam Định",@"namdinh"],
                 @[@"Nghệ An",@"nghean"],
                 @[@"Ninh Bình",@"ninhbinh"],
                 @[@"Ninh Thuận",@"ninhthuan"],
                 @[@"Phú Thọ",@"phutho"],
                 @[@"Phú Yên",@"namdinh"],
                 @[@"Quảng Bình",@"quangbinh"],
                 @[@"Quảng Ngãi",@"quangngai"],
                 @[@"Quảng Trị",@"quangtri"],
                 @[@"Sóc Trăng",@"soctrang"],
                 @[@"Sơn La",@"sonla"],
                 @[@"Tây Ninh",@"tayninh"],
                 @[@"Thái Bình",@"thaibinh"],
                 @[@"Thái Nguyên",@"thainguyen"],
                 @[@"Thanh Hóa",@"thanhhoa"],
                 @[@"Thừa Thiên Huế",@"thuathienhue"],
                 @[@"Tiền Giang",@"tiengiang"],
                 @[@"Trà Vinh",@"travinh"],
                 @[@"Tuyên Quang",@"tuyenquang"],
                 @[@"Vĩnh Long",@"vinhlong"],
                 @[@"Vĩnh Phúc",@"vinhphuc"],
                 @[@"Yên Bái",@"yenbai"],
                 @[@"Vũng Tàu",@"vungtau"],
                 ];
    self.navigationItem.title = @"My Radio";

    [self.navigationController.navigationBar
                    setBackgroundImage:[UIImage imageNamed:@"topHeader.png"]
                        forBarPosition:UIBarPositionAny
                            barMetrics:UIBarMetricsDefault];

    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

//-(IBAction) select_channel:(id)sender{
//    NSLog(@"Clicked");
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Pragma mark collection view method

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return channels.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath: indexPath];
    UILabel *lable = (UILabel *)[cell viewWithTag:100];

    lable.text = [channels objectAtIndex:indexPath.row][0];
    
    [cell.layer setBorderWidth:4.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:40.0f];
    
    return cell;
}




-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselected %@", channels[indexPath.row][0]);
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString: @"channelCellPress"]) {
        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        DetailViewController *dvc   = [segue destinationViewController];
        dvc.channel_title           = @"Bản tin cuối ngày";
        dvc.channel_hour            = [NSString stringWithFormat:@"Phát sóng lúc 22:55"];
        dvc.channel                 = [NSString stringWithFormat:@"%@", channels[selectedIndexPath.row][0]];
        dvc.stream_url              = [NSString stringWithFormat:@"http://vov.radiovietnam.vn:1935/live/%@.stream/playlist.m3u8",channels[selectedIndexPath.row][1]];
    }
}

@end
