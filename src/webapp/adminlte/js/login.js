let checkLogin = () => {
    // 获取用户名和密码
    const username = $("#username").val();
    const password = $("#password").val();

    $.post(
        // 参数1：请求路径
        "/user",
        // 提交的数据
        { method: "checkLogin", username, password },
        // 成功的callback
        (data) => {
            if (data === "SUCCESS") {
                // console.log(">>>" + data);
                // 把登录用户的信息存储在sessionStorage
                sessionStorage.setItem("userInSession", username);

                location.href = "/adminlte/site/index.html";
            } else {
                //提示用户名密码错误
                $("#tips").text("用户名或密码错误");
            }
        }
    );
};