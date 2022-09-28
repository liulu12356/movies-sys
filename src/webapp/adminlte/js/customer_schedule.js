const mid = location.href.substring(location.href.lastIndexOf("?") + 1).split("=")[1];


//给i标签添加class属性
let iAddClass = (id, name) => {
    name = "#" + name;
    if (id % 5 === 0) {
        $(name).addClass("fas fa-circle fa-2x text-green");
    } else if (id % 5 === 1) {
        $(name).addClass("fas fa-circle fa-2x text-blue");
    } else if (id % 5 === 2) {
        $(name).addClass("fas fa-circle fa-2x text-yellow");
    } else if (id % 5 === 3) {
        $(name).addClass("fas fa-circle fa-2x text-red");
    } else if (id % 5 === 4) {
        $(name).addClass("fas fa-circle fa-2x text-orange");
    }
}
let fillCardBody = (movieItem, categoryShow) => {

    $("#showPic").attr("src", movieItem.path);
    $("#title").text(movieItem.title);
    $("#detail").text(movieItem.detail);


    categoryShow.empty();
    for (const category of movieItem.categoryList) {
        categoryShow.append(
            `<label class="btn btn-default text-center active">
                    <input type="radio" id=${category.id} autocomplete="off"> 
                    ${category.name}<br>            
                    <i id=${category.name}></i>
                  </label>`
        )
        iAddClass(category.id, category.name);
    }
    ;

    $("#description").text(movieItem.description);

}

let loadmovieItem = () => {

    const categoryShow = $("#categoryShow");

    $.ajax({
        type: "get",
        url: `/movie/${mid}`,
        success: (data) => {
            movieBean = {...data};
            // 填充电影详情卡片
            fillCardBody(movieBean, categoryShow);
        }

    })
}

loadmovieItem();

let loadScheduleList = () => {

    $.ajax({
        type: "get",
        url: `/schedule/${mid}`,
        success: (data) => {
            const tbody = $("#tb");
            fillTbody(data, tbody);
        }

    })

}

let fillTbody = (scheduleList, tb) => {
    //填充tbody
    tb.empty();


    for (const schedule of scheduleList) {
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


        tr.appendTd(schedule.id);
        tr.appendTd(schedule.start);
        tr.appendTd(schedule.end);


        tr.appendTd(
            `<button type="button" class="btn btn-success btn-sm mx-1" onclick="toBuyTicket(${schedule.id})" data-toggle="modal" data-target="#modal-ticket">购票</button>`,
            true
        );

    }

};

loadScheduleList();


let Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});


let toBuyTicket = (scheduleId) => {
    const modalBody = $("#modalBody");
    $.ajax({
        type: "get",
        url: `/ticket/${scheduleId}`,
        success: (ticketList) => {
            modalBody.empty();
            modalBody.append(`<input type="hidden" id="scheduleId"  name ="scheduleId" value=${scheduleId}>`);
            let size = 1;
            const saleTicketList=[];
            for (const ticket of ticketList) {
                //将已售完的票的id记录下来
                if(ticket.status===0){saleTicketList.push(ticket.tid)}
                if (size % 12 === 1) {
                    modalBody.append(`<div class="col-1"></div>
                                     <div class="col-1"><input type="checkbox" id=${ticket.sequenceNo} value=${ticket.tid} name="seat"/>${ticket.sequenceNo}</div>`);
                    size += 2;
                } else if (size % 12 === 11) {
                    modalBody.append(`<div class="col-1"><input type="checkbox" id=${ticket.sequenceNo} value=${ticket.tid} name="seat"/>${ticket.sequenceNo}</div>
                                       <div class="col-1"></div>`);
                    size += 2;
                } else {
                    modalBody.append(`<div class="col-1"><input type="checkbox"  id=${ticket.sequenceNo} value=${ticket.tid} name="seat"/>${ticket.sequenceNo}</div>`);
                    size++;
                }

            }
            //将已售完的票的设为已选中和不可更改
             saleTicketList.forEach((tid)=>{
                 $(`input[name='seat'][value=${tid}]`).attr("checked",true)
                 $(`input[name='seat'][value=${tid}]`).attr("disabled",true)
             })


        }

    })
}


let buyTicket = () => {


    let ticketIdList = [];	//声明一个数组用来存放遍历出来的checkbox value值
    $("input[name='seat']:checked").each(function (i) {	//遍历
        ticketIdList.push($(this).val());	//将我们遍历出来的值push到数组中
        //最后可以提交arr就可以实现将我们选中的checkbox的value值提交
    })

    //拿到购票的用户的id，写入票单数据中
    let userId = sessionStorage.getItem("userId");
    const scheduleId = $("#scheduleId").val();


    $.ajax({
        type: "post",
        url: `/ticket/buy/${ticketIdList}`,
        data: {userId, scheduleId},
        success: (data) => {
            Toast.fire({
                icon: 'success',
                title: '购票成功'
            });
        }
    })
}

