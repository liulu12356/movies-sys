let loadUserInSession = () => {
    let name = sessionStorage.getItem("userInSession");
    $("#loginUser").text(name);
};

loadUserInSession();

let fillTbody = (movieList, tb) => {
    //填充tbody
    tb.empty();

    for (const movie of movieList) {
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


        tr.appendTd(movie.id);
        tr.appendTd(movie.title);
        tr.appendTd(movie.description);
        tr.appendTd(movie.detail);
        const badge = movie.state ? `<span class="badge badge-success">有效</span>` : `<span class="badge badge-danger">无效</span>`;
        tr.appendTd(`<td>${badge}</td>`, true);

        tr.appendTd(movie.createdTime);
        tr.appendTd(movie.modifiedTime);


        //还有两个按钮
        tr.appendTd(
            `<button type="button" class="btn btn-danger btn-sm mx-1" onclick="showDelModal(${movie.id})" data-toggle="modal" data-target="#modal-del">删除</button><button class="btn btn-primary btn-sm" type="button" onclick="toUpdate(${movie.id} )" data-toggle="modal" data-target="#modal-update">更新</button>`,
            true
        );
    }
};


let fillSelector = (categoryList, select) => {
    for (const category of categoryList) {
        select.append(`<option value=${category.id}>${category.name}</option>`);
    }

}

// 动态加载类别
let loadCategory = () => {
    const select = $("#selectAll");
    $.ajax({
        type: "get",
        url: "/category",
        success: (data) => {
            fillSelector(data, select);
        }
    })
}

loadCategory();


let findMovieByCategory = () => {
    const categoryId = $("#selectAll").val();
    console.log(categoryId);
    $.ajax({
        type: "get",
        url: `/movie/findByCategory/${categoryId}`,
        success: (data) => {
            let tbody = $("#tb");
            fillTbody(data, tbody);
        }
    })

}

let findByKeyword = () => {
    let keyword = $("#keyword").val();
    if (keyword === "") {
        loadmovieList();
    } else {
        $.ajax({
            type: "get",
            url: `/movie/findByTitle/${keyword}`,
            success: (data) => {
                // 清空
                let tbody = $("#tb");
                fillTbody(data, tbody);
            }
        });
    }
};


let loadmovieList = () => {
    // 获取tbody标签
    const tb = $("#tb"); // jQuery封装的类型

    // 发送异步请求查询数据
    $.get(
        // 参数1：url
        "/movie",
        (data) => {
            fillTbody(data, tb);
        }
        // 填写的是函数的引用，它也是一个值
    );

};

loadmovieList();

let showDelModal = (id) => {
    // 事件叠加：原先的弹窗事件依然有效
    $("#delId").val(id); // 赋值
};

let toUpdate = (movieId) => {
    $.ajax({
        type: "get",
        url: `/movie/${movieId}`,
        success: (movie) => {
            $("#id").val(movie.id);
            $("#title").val(movie.title);
            $("#description").val(movie.description);
            $("#detail").val(movie.detail);
            $(`input:radio[name='status'][value='${movie.state}']`).attr("checked", true);
            $("uploadPic").val(movie.path)
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
    const state = parseInt($("input[name='status']:checked").val());
    const title = $("#title").val();
    const description = $("#description").val();
    const detail = $("#detail").val();
    const uploadPic = $("#uploadPic")[0].files[0];
    // 封装一个用来提交的数据，模拟一个传统的form标签提交
    // FormData官方文档： https://developer.mozilla.org/zh-CN/docs/Web/API/FormData/Using_FormData_Objects
    const data = new FormData();
    data.append("title", title);
    data.append("description", description);
    data.append("detail", detail);
    data.append("state", state);
    data.append("uploadPic", uploadPic);


    $.ajax({
        type: id ? "put" : "post",
        url: "/movie",
        data,
        success: (data) => {
            if (data === "UpdateOK") {
                Toast.fire({
                    icon: 'success',
                    title: '更新成功'
                });
                loadmovieList();
            }
            if (data === "SaveOK") {
                Toast.fire({
                    icon: 'success',
                    title: '新增成功'
                });
                loadmovieList();
            }
        },
        processData: false,  // 不处理数据
        contentType: false,

    })


}

let toSave = () => {
    $("#id").val("");
    $("#title").val("");
    $("#description").val("");
    $("#detail").val("");
    $(`input:radio[name='status'][value=1]`).attr("checked", true);
}

let delMovieById = () => {
    const id = $("#delId").val();

    $.ajax({
        type: "delete",
        url: `/movie/${id}`,
        success: (data) => {

            if (data === "OK") {
                Toast.fire({
                    icon: 'success',
                    title: '删除成功'
                });
                loadmovieList();
            }
        }
    });
};

