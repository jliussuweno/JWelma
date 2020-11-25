//
//  ViewController.m
//  Welmar
//
//  Created by jliussuweno on 25/11/20.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *imagesArray;
    int currentIndex;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    imagesArray = [[NSMutableArray alloc]init];
    NSData * imageData1 = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://picsum.photos/id/0/5616/3744"]];
    UIImage *img1 = [UIImage imageWithData: imageData1];
    NSData * imageData2 = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://picsum.photos/id/1/5616/3744"]];
    UIImage *img2 = [UIImage imageWithData: imageData2];
    NSData * imageData3 = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"https://picsum.photos/id/10/2500/1667"]];
    UIImage *img3 = [UIImage imageWithData: imageData3];
    
    [imagesArray addObject:img1];
    [imagesArray addObject:img2];
    [imagesArray addObject:img3];
    _slideImageCollectionView.delegate = self;
    _slideImageCollectionView.dataSource = self;
    _pageIndicator.numberOfPages = imagesArray.count;
    [self startTimerThread];
}

- (void)startTimerThread {
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction {
    int desiredScrollPosition = (currentIndex < imagesArray.count - 1) ? currentIndex + 1 : 0;
    [_slideImageCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:desiredScrollPosition inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:TRUE];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"slideShowCell" forIndexPath:indexPath];
    cell.slideImage.image = imagesArray[indexPath.row];
    cell.slideImage.contentMode = UIViewContentModeScaleAspectFit;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imagesArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    currentIndex = scrollView.contentOffset.x / _slideImageCollectionView.frame.size.width;
    _pageIndicator.currentPage = currentIndex;
}




@end
