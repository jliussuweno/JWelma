//
//  ViewController.h
//  Welmar
//
//  Created by jliussuweno on 25/11/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *slideImageCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageIndicator;


@end

