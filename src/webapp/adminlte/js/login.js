let checkLogin = () => {
    // 获取用户名和密码
    const username = $("#username").val();
    const password = $("#password").val();

    $.ajax({// 参数1：请求路径
            type: "post",
            url: "/user/login",
            data:{username,password},
            success: (user) => {
                if (user) {
                    console.log(user)
                    // 把登录用户的信息存储在sessionStorage
                    sessionStorage.setItem("userInSession", username);
                    sessionStorage.setItem("userId", user.userId);
                    if(user.role===0){
                        location.href = "/adminlte/site/category.html";
                    } else {
                        location.href = "/adminlte/site/customer_movie.html";
                    }
                } else {
                    //提示用户名密码错误
                    $("#tips").text("用户名或密码错误");
                }
            }
        }
    );
};