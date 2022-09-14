let fillTbody = (empList, tb) => {
    //填充tbody
    tb.empty();

    for (const emp of empList) {
        // 创建一个空行（元素节点）
        const tr = document.createElement("tr"); // 原始的DOM节点
        tb.append(tr);

        // 给tr动态的新增一个方法
        tr.appendTd = function (value, isHtml = false) {
            const td = document.createElement("td");

            if (!isHtml) td.innerText = value;
            else td.innerHTML = value;

            tr.appendChild(td);
        };


        tr.appendTd(emp.employeeId);
        tr.appendTd(`${emp.firstName} . ${emp.lastName}`);
        tr.appendTd(emp.jobTitle);
        tr.appendTd(emp.salary);
        tr.appendTd(emp.reportsTo);
        tr.appendTd(emp.officeId);


        //还有两个按钮
        tr.appendTd(
            `<button type="button" class="btn btn-danger btn-sm mx-1" onclick="showDelModal(${emp.employeeId})" data-toggle="modal" data-target="#modal-del">删除</button><button class="btn btn-primary btn-sm" type="button" onclick="toUpdate(${emp.employeeId})">更新</button>`,
            true
        );
    }
};


let findEmpListByOfficeId = () => {
    // 获取要提交给后台的数据-选中的部门的ID
    // const officeId = document.querySelector("#officeId").value;
    const officeId = $("#officeId").val();

    $.get(
        "/emp",
        { method: "findByOfficeId", officeId },
        (data) => {
            // 清空
            let tbody = $("#tb");
            fillTbody(data, tbody);
        }
    );

};

let findByKeyword = () => {
    let keyword = $("#keyword").val();
    $.ajax({
        type: "get",
        url: "/emp",
        data: { method: "findByKeyword", keyword },
        success: (data) => {
            // 清空
            let tbody = $("#tb");
            // for (const emp of data) {
            //     createRow(emp, document.getElementById("tb"));
            // }
            fillTbody(data, tbody);
        }
    });
};



let loadEmpList = () => {
    // 获取tbody标签
    const tb = $("#tb"); // jQuery封装的类型

    // 发送异步请求查询数据
    $.get(
        // 参数1：url
        "/emp",
        { method: "findAll" },
        (data) => {
            fillTbody(data, tb);
        }
        // 填写的是函数的引用，它也是一个值
    );

};

loadEmpList();

let showDelModal = (employeeId) => {
    // 事件叠加：原先的弹窗事件依然有效
    // const modal = document.getElementById('modal-del');
    // console.log(modal);
    // $("#modal-del").show();
    $("#delId").val(employeeId); // 赋值
};

let Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

let delEmpById = () => {
    const employeeId = $("#delId").val();

    $.get(
        "/emp",
        { method: "delByEmployeeId", employeeId },
        (data) => {
            if (data === "OK") {
                Toast.fire({
                    icon: 'success',
                    title: '删除成功'
                });
                loadEmpList();
            }
        }
    );
};