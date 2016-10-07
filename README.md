# MasonryFirDemo
Masonry简单使用 合集

demo效果图

效果图：

![](https://github.com/shaveKevin/MasonryFirDemo/blob/master/MasonryDemo.gif)



 上面的约束的优先级是什么意思呢？这里就做一些介绍
 我们先看系统提供的api 然后再来进行分析：
 
#Method setContentHuggingPriority:forAxis:

原文：
  Custom views should set default values for both orientations on creation, based on their content, typically to UILayoutPriorityDefaultLow or UILayoutPriorityDefaultHigh. When creating user interfaces, the layout designer can modify these priorities for specific views when the overall layout design requires different tradeoffs than the natural priorities of the views being used in the interface.
  
翻译：
 
 
#Method  setContentCompressionResistancePriority:forAxis
 
 原文：
 Sets the priority with which a view resists being made smaller than its intrinsic size.
 
 Custom views should set default values for both orientations on creation, based on their content, typically to UILayoutPriorityDefaultLow or UILayoutPriorityDefaultHigh. When creating user interfaces, the layout designer can modify these priorities for specific views when the overall layout design requires different tradeoffs than the natural priorities of the views being used in the interface.
 
翻译：
 
#Method  intrinsicContentSize
 
原文：
 Custom views typically have content that they display of which the layout system is unaware. Overriding this method allows a custom view to communicate to the layout system what size it would like to be based on its content. This intrinsic size must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height, for example.
 
 If a custom view has no intrinsic size for a given dimension, it can return UIViewNoIntrinsicMetric for that dimension.
 
 翻译：
 
##需求：
  并排三个label，宽度由内容决定。父级View宽度不够时，优先显示左边label和右边label的内容
 遇到这种跟内容压缩、优先级有关的布局，就不得不提Autolayout中的两个重要的属性“Content Compression Resistance”和“Content Hugging”。
 
 Content Compression Resistance = 不许挤我！
 
 对，这个属性说白了就是“不许挤我”
 这个属性的优先级（Priority）越高，越不“容易”被压缩。也就是说，当整体的空间装不下所有的View的时候，Content Compression Resistance优先级越高的，显示的内容越完整。
 Content Hugging = 抱紧！
 
 这个属性的优先级越高，整个View就要越“抱紧”View里面的内容。也就是View的大小不会随着父级View的扩大而扩大。
 
##分析
 
 根据要求，可以将约束分为两个部分：
 
  整体空间足够时，三个label的宽度由内容决定，也就是说，label的“Content Hugging”优先级很高，而且没有固定的Width属性。
  整体空间不够时，左边的label和右边的label更不容易被压缩，也就是“Content Compression Resistance”优先级更高。
 
##重点：
 
  label不设置具体的宽度（width）属性，宽度由内容决定。
  显示的优先级由“Content Compression Resistance”属性的高低决定。
  
一些解释：
 
 static const UILayoutPriority UILayoutPriorityRequired NS_AVAILABLE_IOS(6_0) = 1000;
  // A required constraint.  Do not exceed this.
static const UILayoutPriority 

UILayoutPriorityDefaultHigh NS_AVAILABLE_IOS(6_0) = 750; 
// This is the priority level with which a button resists compressing its content.

static const UILayoutPriority 
UILayoutPriorityDefaultLow NS_AVAILABLE_IOS(6_0) = 250; 
// This is the priority level at which a button hugs its contents horizontally.

static const UILayoutPriority UILayoutPriorityFittingSizeLevel NS_AVAILABLE_IOS(6_0) = 50; 
// When you send -[UIView systemLayoutSizeFittingSize:], the size fitting most closely to the target size (the argument) is computed.  UILayoutPriorityFittingSizeLevel is the priority level with which the view wants to conform to the target size in that computation.  It's quite low.  It is generally not appropriate to make a constraint at exactly this priority.  You want to be higher or lower. 









