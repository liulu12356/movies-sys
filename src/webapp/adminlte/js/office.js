let fillOfficeSelect = (officeList) => {
    // 定位到select标签
    let select = $("#officeId");

    // 清空下拉框
    select.html("");

    // 用for填充数据
    //select.html("<option>---请选择---</option>");

    select.append(`<option value="-1">---请选择---</option>`);

    for (const office of officeList) {
        // 添加select标签的子元素
        select.append(`<option value="${office.officeId}">${office.city}</option>`);
    }
};


let loadOfficeList = () => {
    // 以GET方式提交异步请求
    $.get({
        // 后台地址
        url: "/user?method=findOffices",
        success: (data) => { // jQuery在成功的获取到后台返回的数据以后，会自动的调用我们分配的回调函数
            fillOfficeSelect(data);
        }
    }
    );
};

loadOfficeList();