//
//  ProfileVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 27..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ProfileVC.h"

@interface ProfileVC () <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *profileImage;
@property (nonatomic, strong) UITableView *tv;

@property (nonatomic) CGFloat heightForView;
@property (nonatomic) CGFloat widthForView;

@end

@implementation ProfileVC
{
  BOOL isCalling;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.tv.delegate = self;
  self.tv.dataSource = self;
  
  
  isCalling = NO;
  
  [self changeProfile];
  [self drawBtn];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (IBAction)dismissAction:(id)sender {
  
  [self dismissViewControllerAnimated:YES completion:nil];
  
}

#pragma helper Method

//DrawBtn

-(void)drawBtn {
  
  UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, self.tv.frame.origin.y + self.tv.frame.size.height, self.view.frame.size.width, 40)];
  v.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
  
  [self.view addSubview:v];
  
  //버튼 정의함
  UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(v.frame.size.width / 2, v.frame.size.height / 2, 100, 20)];
  
  [v addSubview:btn];
  
  
}

//Tap했을시, gesture 동작
-(void) changeProfile {
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(profile)];
  [self.profileImage addGestureRecognizer:tap];
  //[self.profileImage isUserInteractionEnabled:YES];
  
}

//profile 구성을 위한 메서드 (사진, 라이브러리)
-(void)profile {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"사진을 가져올 곳을 선택하세요" preferredStyle:UIAlertControllerStyleActionSheet];
  
  //카메라 사용시
  
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    
    [alert addAction:[UIAlertAction actionWithTitle:@"카메라" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [self imagePicker:UIImagePickerControllerSourceTypeCamera];
    }]];

  }
  
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
    
    [alert addAction:[UIAlertAction actionWithTitle:@"앨범" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [self imagePicker:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }]];
    
  }
  
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
    
    [alert addAction:[UIAlertAction actionWithTitle:@"포토 라이브러리" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      [self imagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    
  }
  
  [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
  
  [self presentViewController:alert animated:YES completion:nil];
  
  
}

//이미지 피커를 활용하여 사진 변경 기능을 구현한다.

-(void)imagePicker:(UIImagePickerControllerSourceType)source {
  
  UIImagePickerController *picker = [UIImagePickerController new];
  picker.sourceType = source;
  picker.delegate = self;
  picker.allowsEditing = YES;
  [self presentViewController:picker animated:YES completion:nil];
  
}


#pragma imagePicker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
  
  //[UIApplication.sharedApplication isNetworkActivityIndicatorVisible:YES];
  [picker dismissViewControllerAnimated:YES completion:nil];
  
  
  
}




#pragma Table View delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}


@end
