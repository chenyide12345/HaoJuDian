//
//  MyPhotoViewController.m
//  HaoJuDian
//
//  Created by 陈义徳 on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MyPhotoViewController.h"
#import "PhotoCollectionViewCell.h"
#import "ZWCollectionViewFlowLayout.h"

@interface MyPhotoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, ZWwaterFlowDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, copy) NSString * imagePath;

@end

@implementation MyPhotoViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupViews];
}


#pragma mark -
#pragma mark - 加载导航栏

- (void)setupNav
{
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我的相册";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    UIButton * delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delegateBtn.frame = CGRectMake(0, 0, 30, 20);
    delegateBtn.backgroundColor = [UIColor clearColor];
    [delegateBtn setTitle:@"删除" forState:UIControlStateNormal];
    [delegateBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    delegateBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [delegateBtn addTarget:self action:@selector(delegateBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc] initWithCustomView:delegateBtn];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    
}



#pragma mark - 加载Views

- (void)setupViews
{
    ZWCollectionViewFlowLayout * layOut = [[ZWCollectionViewFlowLayout alloc] init];
    layOut.degelate =self;
    layOut.colCount = 2;   //列数
    layOut.rowMagrin = 10; //行间距
    layOut.colMagrin = 10; //列间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layOut];
    self.collectionView.delegate =self;
    self.collectionView.dataSource =self;
    self.collectionView.backgroundColor = BACKGROUNDCOLOR;
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    
    //获取Documents文件夹目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定新建文件夹路径
    NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"ImageFile"];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    //保存图片的路径
    self.imagePath = [imageDocPath stringByAppendingPathComponent:@"image.png"];
    
}




#pragma mark - CollectionView ---------------------------------------
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"-----------------");
    }
    
    if (indexPath.row == 0) {
        cell.imgView.image = [UIImage imageNamed:@"tianjiaxiangpian"];
    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                        initWithTitle:nil
                                        delegate:self
                                        cancelButtonTitle:@"取消"
                                        destructiveButtonTitle:nil
                                        otherButtonTitles: @"拍照", @"从相册选择",nil];
        [myActionSheet showInView:self.view];
        
    }
    NSLog(@"%@",@(indexPath.row).description);
}

#pragma mark -- UICollectionViewDelegate

//代理方法
-(CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{
    //    shopModel * shop = self.shops[indexPach.item];
    //    return shop.h/shop.w*width;
    return (WIDTH-30)/2/0.91;
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            //拍照
            [self takePhoto];
            break;
        case 1:
            //从相册选择
            [self LocalPhoto];
            break;
        default:
            break;
    }
}



//从相册选择
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
        
    }];
    
}


//拍照
-(void)takePhoto
{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
            
        }];
        
    }else {
        NSLog(@"该设备无摄像头");
    }
}


#pragma Delegate method UIImagePickerControllerDelegate

//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    //当图片不为空时显示图片并保存图片
    if (image != nil) {
        //图片显示在界面上
        
        
        //以下是保存文件到沙盒路径下
        //把图片转成NSData类型的数据来保存文件
        NSData *data;
        //判断图片是不是png格式的文件
        if (UIImagePNGRepresentation(image)) {
            //返回为png图像。
            data = UIImagePNGRepresentation(image);
        }else {
            //返回为JPEG图像。
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        //保存
        [[NSFileManager defaultManager] createFileAtPath:self.imagePath contents:data attributes:nil];
        
    }
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
