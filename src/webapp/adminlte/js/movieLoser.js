let fillMainContext = (movieList, mainContent) => {
    //填充tbody
    mainContent.empty();
    let size = 0;
    for (const movie of movieList) {
        // 创建一行（元素节点）
        const row = $(" <div class=\"row\"></div>");
        mainContent.append(row);

        // 创建卡片body内容
        const cardBody = $(`<dd>${movie.modifiedTime}</dd>`)
            .appendTo($(`<dt>创建时间</dt>`))
            .appendTo($(`<dd>${movie.createdTime}</dd>`))
            .appendTo($(`<dt>创建时间</dt>`))
            .appendTo($(`<dd>${movie.detail}</dd>`))
            .appendTo($(`<dt>详情</dt>`))
            .appendTo($(`<dd>${movie.description}</dd>`))
            .appendTo($(`<dt>简介</dt>`))
            .appendTo($(`<dd>${movie.title}</dd>`))
            .appendTo($(`<dt>标题</dt>`))


        //卡片头部和结构
        row.append($(`<div class=\"card\" style=\"width: 18rem;\"><img src=${movie.path} class=\\"card-img-top\\" alt=\\"...\\"></div>`))
            .append($("<div class=\"card-body\"></div>"))
            .append($("<dl></dl>"))
            .append(cardBody)

    }
};

let loadMovieList = () => {
    // 获取tbody标签
    const mainContent = $("#mainContent"); // jQuery封装的类型

    // 发送异步请求查询数据
    $.get(
        // 参数1：url
        "/movie",
        (data) => {
            fillMainContext(data, mainContent);
            console.log(1)
        }
        // 填写的是函数的引用，它也是一个值
    );

};

loadMovieList();

// let findmovieListByOfficeId = () => {
//     // 获取要提交给后台的数据-选中的部门的ID
//     // const officeId = document.querySelector("#officeId").value;
//     const officeId = $("#officeId").val();
//
//     $.get(
//         "/movie",
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
// let findByKeyword = () => {
//     let keyword = $("#keyword").val();
//     if (keyword === "") {
//         loadmovieList();
//     } else {
//         $.ajax({
//             type: "get",
//             url: `/movie/findByName/${keyword}`,
//             success: (data) => {
//                 // 清空
//                 const mainContext = $("#mainContext");
//                 fillTbody(data, mainContext);
//             }
//         });
//     }
// };


// let showDelModal = (id) => {
//     // 事件叠加：原先的弹窗事件依然有效
//     $("#delId").val(id); // 赋值
// };

// let toUpdate = (movieId) => {
//     $.ajax({
//         type: "get",
//         url: `/movie/${movieId}`,
//         success: (movie) => {
//             $("#id").val(movie.id);
//             $("#name").val(movie.name);
//             $("#comment").val(movie.comment);
//             $(`input:radio[name='status'][value='${movie.state}']`).attr("checked", true);
//         }
//     })
//
// };


// let Toast = Swal.mixin({
//     toast: true,
//     position: 'top-end',
//     showConfirmButton: false,
//     timer: 3000
// });

// let saveOrUpdate = () => {
//
//     let id = $("#id").val() ? parseInt($("#id").val()) : null;
//     const name = $("#name").val();
//     const comment = $("#comment").val();
//     const state = parseInt($("input[name='status']:checked").val());
//     const data = {id, name, comment, state};
//
//     console.log(data);
//     console.log(JSON.stringify(data));
//
//     $.ajax({
//         type: id ? "put" : "post",
//         url: "/movie",
//         data: JSON.stringify(data),
//         success: (data) => {
//             if (data === "UpdateOK") {
//                 Toast.fire({
//                     icon: 'success',
//                     title: '更新成功'
//                 });
//                 loadmovieList();
//             }
//             if (data === "SaveOK") {
//                 Toast.fire({
//                     icon: 'success',
//                     title: '新增成功'
//                 });
//                 loadmovieList();
//             }
//         },
//         contentType: "application/JSON;charset=utf-8"
//
//     })
//
//
// }
//
// let toSave = () => {
//     $("#id").val("");
//     $("#name").val("");
//     $("#comment").val("");
//     $("input:radio[name='status'][value=1]").attr("checked", true);
// }

let delMovieById = () => {
    const id = $("#delId").val();

    $.ajax({
        type: "delete",
        url: "/movie",

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