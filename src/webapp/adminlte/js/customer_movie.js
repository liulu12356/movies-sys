let loadUserInSession = () => {
    let name = sessionStorage.getItem("userInSession");
    $("#loginUser").text(name);
};

loadUserInSession();


let  fillCard=(movieList, movieCard)=> {
        movieCard.empty();
    for (const movie of movieList) {
        movieCard.append(` <div class="col mb-4">
                    <div class="card h-100">
                        <img src=${movie.path} class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">${movie.title}</h5>
                            <p class="card-text">${movie.detail}</p>
                            <button type="button" class="btn btn-success" onclick="toMovieSchedule(${movie.id})">购票</button>
                        </div>
                    </div>
                </div>`)
    }

}

let loadMovieList=()=>{



    $.ajax({
        type:"get",
        url:"/customerMovie",
        success:(data)=>{
            console.log(data);
            const movieCard=$("#movieCard");
            fillCard(data,movieCard);
        }
    })
}

loadMovieList();


let fillSelector = (categoryList, select) => {
    for (const category of categoryList) {
        select.append(`<option value=${category.id}>${category.name}</option>`);
    }

}

let loadCategory = (select) => {

    $.ajax({
        type: "get",
        url: "/category",
        success: (data) => {
            fillSelector(data, select);
        }
    })
}
const select=$("#selectMovieCategory");
loadCategory(select);

let toMovieSchedule=(id)=>{
    location.href = `/adminlte/site/customer_schedule.html?id=${id}`;
}