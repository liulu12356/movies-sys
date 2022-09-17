let loadUserInSession = () => {
    let name = sessionStorage.getItem("userInSession");
    $("#loginUser").text(name);
};

loadUserInSession();

let fillTbody = (categoryList, tb) => {
    //填充tbody
    tb.empty();

    for (const category of categoryList) {
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


        tr.appendTd(category.id);
        tr.appendTd(category.name);
        tr.appendTd(category.comment);
        const badge = category.state ? `<span class="badge badge-success">有效</span>` : `<span class="badge badge-danger">无效</span>`;
        tr.appendTd(`<td>${badge}</td>`, true);

        tr.appendTd(new Date(category.createdTime).toLocaleString());
        tr.appendTd(new Date(category.modifiedTime).toLocaleString());


        //还有两个按钮
        tr.appendTd(
            `<button type="button" class="btn btn-danger btn-sm mx-1" onclick="showDelModal(${category.id})" data-toggle="modal" data-target="#modal-del">删除</button><button class="btn btn-primary btn-sm" type="button" onclick="toUpdate(${category.id} )" data-toggle="modal" data-target="#modal-update">更新</button>`,
            true
        );
    }
};


// let findcategoryListByOfficeId = () => {
//     // 获取要提交给后台的数据-选中的部门的ID
//     // const officeId = document.querySelector("#officeId").value;
//     const officeId = $("#officeId").val();
//
//     $.get(
//         "/category",
//         { method: "findByOfficeId", officeId },
//         (data) => {
//             // 清空
//             let tbody = $("#tb");
//             fillTbody(data, tbody);
//         }
//     );
//
// };
//
let findByKeyword = () => {
    let keyword = $("#keyword").val();
    if (keyword === "") {
        loadCategoryList();
    } else {
        $.ajax({
            type: "get",
            url: `/category/findByName/${keyword}`,
            success: (data) => {
                // 清空
                let tbody = $("#tb");
                fillTbody(data, tbody);
            }
        });
    }
};


let loadCategoryList = () => {
    // 获取tbody标签
    const tb = $("#tb"); // jQuery封装的类型

    // 发送异步请求查询数据
    $.get(
        // 参数1：url
        "/category",
        (data) => {
            fillTbody(data, tb);
        }
        // 填写的是函数的引用，它也是一个值
    );

};

loadCategoryList();

let showDelModal = (id) => {
    // 事件叠加：原先的弹窗事件依然有效
    $("#delId").val(id); // 赋值
};

let toUpdate = (categoryId) => {
    $.ajax({
        type: "get",
        url: `/category/${categoryId}`,
        success: (category) => {
            $("#id").val(category.id);
            $("#name").val(category.name);
            $("#comment").val(category.comment);
            $(`input:radio[name='status'][value='${category.state}']`).attr("checked", true);
        }
    })


};


let Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

let saveOrUpdate = () => {

    let id = $("#id").val() ? parseInt($("#id").val()) : null;
    const name = $("#name").val();
    const comment = $("#comment").val();
    const state = parseInt($("input[name='status']:checked").val());
    const data = { id, name, comment, state };

    console.log(data);
    console.log(JSON.stringify(data));

    $.ajax({
        type: id ? "put" : "post",
        url: "/category",
        data: JSON.stringify(data),
        success: (data) => {
            if (data === "UpdateOK") {
                Toast.fire({
                    icon: 'success',
                    title: '更新成功'
                });
                loadCategoryList();
            }
            if (data === "SaveOK") {
                Toast.fire({
                    icon: 'success',
                    title: '新增成功'
                });
                loadCategoryList();
            }
        },
        contentType: "application/JSON;charset=utf-8"

    })


}

let toSave = () => {
    $("#id").val("");
    $("#name").val("");
    $("#comment").val("");
    $(`input:radio[name='status'][value=1]`).attr("checked", true);
}

let delcategoryById = () => {
    const id = $("#delId").val();

    $.ajax({
        type: "delete",
        url: `/category/${id}`,
        success: (data) => {
            if (data === "OK") {
                Toast.fire({
                    icon: 'success',
                    title: '删除成功'
                });
                loadCategoryList();
            }
        }
    });
};