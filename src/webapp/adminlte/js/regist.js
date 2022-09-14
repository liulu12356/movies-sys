// 只有通过外部文件方式引入的js和css才有可能被浏览器缓存
let checkConfirmPassword = () => {
    const p1 = document.getElementById("password").value;
    const p2 = document.getElementById("confirmPassword").value;
    const spanNode = document.querySelector("#tips");
    if (p1 !== p2) {
        // 设置这个标签(节点)中的文本内容
        // innerHTML它在修改页面内容的时候，会把字符串首先尝试翻译成相应的源码，然后执行，如果不能执行，则会翻译成普通文本
        // 容易出现脚本注入
        // 推荐使用innerText
        spanNode.innerText = "确认密码与密码不一致"; //
        // 禁用保存按钮
    } else {
        spanNode.innerText = "";
    }
};


// const xhr = new XMLHttpRequest();
// let isDuplicate = () => {
//     // 1、创建一个用来发送异步请求的对象

//     const username = document.querySelector("#username").value;
//     // console.log(username);
//     // 2、封装异步请求信息
//     xhr.open(
//         // 请求类型
//         "get",
//         // 请求路径
//         // "/user?method=isDuplicate&username=" +  username
//         // js 字符串模板语法
//         `/user?method=isDuplicate&username=${username}`
//         // 异步开关 ： 默认为异步(true) false-同步(和之前的传统提交方式一样)
//     );

//     // 3、设置请求的回调(callback，即主干流程的事情做完以后，再回头执行指定的逻辑)
//     // 当xhr对象的“准备状态”发生改变的时候，就会执行指定的逻辑
//     xhr.onreadystatechange = myCallback;

//     // 4、发送请求
//     xhr.send();

// };

// let myCallback = () => {
//     console.log(xhr.readyState, xhr.status);
//     if (xhr.readyState === 4 && xhr.status === 200) { // 响应成功
//         // 获取到后台返回的结果
//         if (xhr.responseText === "YES") {  // 重复
//             document.querySelector("#msg").innerText = "用户名重复";
//         } else {
//             document.querySelector("#msg").innerText = "";
//         }
//     }
// };


let isDuplicate = () => {
    // 1、创建一个用来发送异步请求的对象

    const username = document.querySelector("#username").value;
    // console.log(username);
    // 2、封装异步请求信息

    const xhr = new XMLHttpRequest();
    xhr.open(
        // 请求类型
        "get",
        // 请求路径
        // "/user?method=isDuplicate&username=" +  username
        // js 字符串模板语法
        `/user?method=isDuplicate&username=${username}`
        // 异步开关 ： 默认为异步(true) false-同步(和之前的传统提交方式一样)
    );

    // 3、设置请求的回调(callback，即主干流程的事情做完以后，再回头执行指定的逻辑)
    // 当xhr对象的“准备状态”发生改变的时候，就会执行指定的逻辑
    xhr.onreadystatechange = () => { // 回调地狱
        if (xhr.readyState === 4 && xhr.status === 200) { // 响应成功
            // 获取到后台返回的结果
            if (xhr.responseText === "YES") {  // 重复
                document.querySelector("#msg").innerText = "用户名重复";
            } else {
                document.querySelector("#msg").innerText = "";
            }
        }
    };

    // 4、发送请求
    xhr.send();

};