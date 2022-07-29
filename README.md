## flutter 手势密码插件

### 简介
  可以定制化的手势密码组件


### 引入  
```
gesture_password:
    git:
      url: https://github.com/StanleyCocos/gesture_password.git
```

### 使用
```
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        color: Colors.black12,
        child: GesturePasswordWidget(
          // 修改默认圆圈颜色
          color: Colors.lightBlueAccent,
          // 修改选择圆圈颜色
          highlightColor: Colors.red,
          // 修改连线画笔颜色
          pathColor: Colors.red,
          // 圆圈半径
          frameRadius: 30,
          // 圆圈中心点半径
          pointRadius: 4,
          // 连线画笔宽度
          pathWidth: 4,
          // 结果
          onFinishGesture: (result) {
            print(result);
          },
        ),
      ), // body: Container(
    );
  }
```


