# GZJianShu
高仿简书个人中心上下 左右滑动页面，开始做之前，首先思路要清晰，逻辑比较繁琐。
首先看到简书个人中心页面时，我大致给他划分为4大部分：

1，首先是用户的头像

2，用户资料信息

3，三个标题（TitleView）

4，下面UITableView

因为此处有左右滑动和上下两种滑动，所以在上面的2，3，4  我们整体放在一个ScrollView上， 而1，用户头像的改变，根据ScrollView 的上下滑动 y 值对头像大小进行处理。

所有的View都是自定义实现的，控制控制器的大小，之前一阿里朋友告诉我，他们公司的硬性规定，无论页面实现什么功能，在控制器中的代码 不能超过300 行，能封装的尽量封装起来，不做繁琐的代码Copy。

头像大小的改变
 ```- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:ContentOffset] && object == self.scrollView) {
         
        CGFloat offsetY = self.scrollView.contentOffset.y;
        CGFloat scale = 1.0;
        if (offsetY < 0) { // 放大
            scale = MIN(1.5, 1 - offsetY / 300);//简书没有这个功能
        } else if (offsetY > 0) { // 缩小
            scale = MAX(0.40, 1 - offsetY / 300);
        }
        self.yourImages.transform = CGAffineTransformMakeScale(scale, scale);
         
        CGRect frame = self.yourImages.frame;
        frame.origin.y = 15;
        self.yourImages.frame = frame;
    }
}
```
