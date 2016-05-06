//
//  框架的搭建.h
//  yoho_buy_07
//
//  Created by 马马 on 16/3/28.
//  Copyright © 2016年 MDQian. All rights reserved.
//
需要注意的是图片的处理，在`QLResources`中有个`QLImages`文件夹,这个文件夹是供特殊的图片文件而设立的，你不能把所有的图片都塞到这里，这个不科学。最好还是放在Assets.xcassets中，那么到底是哪些图片呢?在有些项目中，大量使用了全屏的背景图片，这样的图片我们一定不能使用[UIImage imageNamed:@"imageName"]的方式加载，因为这个方法会把图片直接缓存到内存中，试想一下，如果很多张图片都塞进内存是什么情况？那就只能使用[UIImage imageWithContentsOfFile:@"imagePath"]的方式，但是我们知道Assets.xcassets中的图片在生成ipa后会被打包成一个压缩文件，以减少内存的占用，这个`imagePath`从哪里来呢，所以问题就解决了。把这些图片放到这个文件夹下面，加载的时候直接用NSBundle解决path的问题，ok！
项目中肯定会遇到多个界面使用同一个数据模型的问题，最好还是在`QLMain`文件夹中创建两个文件夹`QLCommonModel`和`QLCommonView`两个文件夹，以便统一管理。
在Xcode左侧导航中看到的结构中的每一个文件夹(除却Supporting Files)，必须映射到Finder中的文件夹中，这样在不打开项目的情况下，我们就可以迅速的定位出以前写过的工具类的位置，也方便在Finder中查看当前项目的结构
