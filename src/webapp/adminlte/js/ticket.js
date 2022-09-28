
let movieBean=null;
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


        tr.appendTd(`<button class="btn btn-info">${movie.id}</button>`,true);
        tr.appendTd(movie.title);

        for (const schedule of movie.scheduleList) {
            const scheduleBtn=schedule.status?`<button type="button" class="btn btn-secondary  mx-1" onclick="ToTitleModal(${schedule.id})" data-toggle="modal" disabled data-target="#modal-del">
                         档期${schedule.id}</button>` : `<button type="button" class="btn btn-danger  mx-1" onclick="ToTitleModal(${schedule.id})" data-toggle="modal"  data-target="#modal-del">
                         档期${schedule.id}</button>`

            tr.appendTd(
                scheduleBtn
                ,
                true
            );
        }

    }
};



let findByKeyword = () => {
    let keyword = $("#keyword").val();
    if (keyword === "") {
        loadmovieList();
    } else {
        $.ajax({
            type: "get",
            url: `/ticket/findByTitle/${keyword}`,
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
        "/ticket",
        (data) => {
            movieBean={...data};
            console.log(movieBean)
            fillTbody(data, tb);
        }
        // 填写的是函数的引用，它也是一个值
    );

};

loadmovieList();



let Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});


let ToTitleModal=(scheduleId)=>{


    $.ajax({
        type:"get",
        url: `/schedule/ticket/${scheduleId}`,
        success:(schedule)=>{
            $("#scheduleId").val(schedule.id);
            $("#movieId").val(schedule.movieId)
            $("#start").val(schedule.start);
            $("#end").val(schedule.end);
        }

    })
}


let updateTicket=()=>{
    const id=$("#scheduleId").val();
    const movieId=$("#movieId").val();
    const start=$("#start").val();
    const end=$("#end").val();
    const data={id,movieId,start,end}
    $.ajax({
        type:"put",
        url:`/ticket`,
        data:JSON.stringify(data),
        success:(data)=>{
            if(data==="UpdateOK") {
                Toast.fire({
                    icon: 'success',
                    title: '放票成功'
                });
                loadmovieList();
            }
        },
        contentType:"application/json;charset=utf-8"
    })
}









