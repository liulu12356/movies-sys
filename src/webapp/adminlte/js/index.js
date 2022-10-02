let loadUserInSession = () => {
    let name = sessionStorage.getItem("userInSession");
    $("#loginUser").text(name);
};

loadUserInSession();

let handleMenus = (menus) => {
    // 定位菜单的挂载点
    const root = $("#treeMenu");
    root.empty();
    findChildren(root, menus);
    // for (const menu of menus) {
    //     // 创建菜单DOM节点
    //     let textNode =
    //         `<li class="nav-item">
    //           <a href="${menu.path}" class="nav-link">
    //             <i class="nav-icon fas fa-copy"></i>
    //             <p>
    //               ${menu.name}
    //               <i class="fas fa-angle-left right"></i>
    //             </p>
    //           </a>
    //         </li>`;
    //     root.append(textNode);
    //     // childrenNode ul
    // }
};

let findChildren = (parent, children) => {
    for (const menu of children) {
        // 创建菜单DOM节点
        let textNode =
            $(`<li class="nav-item">
              <a href="${menu.path}" class="nav-link">
                <i class="nav-icon fas fa-copy"></i>
                <p>
                  ${menu.name}
                  <i class="fas fa-angle-left right"></i>
                </p>
              </a>
            </li>`);
        parent.append(textNode);

        // 判断当前的menu对象是否有小孩
        if (menu.children) {
            // 先给孩儿们创建一个挂载点
            let next = $('<ul class="nav nav-treeview"></ul>');
            textNode.append(next);
            findChildren(next, menu.children);
        }
    }
};

let loadMenu = () => {
    // 先到sessionStorage中去get
    // Y handleMenus
    // N 发送异步请求获得菜单数据
    $.get(
        "/user",
        { method: "loadMenus" },
        (menus) => {
            handleMenus(menus);
        }
    );
};

loadMenu();

