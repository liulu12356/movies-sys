# 影院管理系统

## 0. 参考文档

SpringCore [https://docs.spring.io/spring-framework/docs/5.2.22.RELEASE/spring-framework-reference/core.html#spring-core](https://docs.spring.io/spring-framework/docs/5.2.22.RELEASE/spring-framework-reference/core.html#spring-core)

SpringMVC [https://docs.spring.io/spring-framework/docs/5.2.22.RELEASE/spring-framework-reference/web.html#spring-web](https://docs.spring.io/spring-framework/docs/5.2.22.RELEASE/spring-framework-reference/web.html#spring-web)

MyBatis [https://mybatis.org/mybatis-3/zh/getting-started.html](https://mybatis.org/mybatis-3/zh/getting-started.html)

MyBatis-Plus [https://baomidou.com/](https://baomidou.com/)

mvnrepo [https://mvnrepository.com/](https://mvnrepository.com/)

bootstrap [https://getbootstrap.com/docs/5.2/getting-started/introduction/](https://getbootstrap.com/docs/5.2/getting-started/introduction/)

adminLTE [https://adminlte.io/](https://adminlte.io/)

MDN - Javascript [https://developer.mozilla.org/zh-CN/docs/Web/JavaScript](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript)

jQuery [https://api.jquery.com/](https://api.jquery.com/)

## 1. 影院后台管理系统

该模块需要完成电影相关基本信息的维护，目前只需要指定一个admin（角色）

### 1.1 建模

类别表（category）

| 列名          | 类型     | 说明             |
| ------------- | -------- | ---------------- |
| id            | int      | 主键             |
| name          | varchar  | 类别名称         |
| comment       | varchar  | 备注             |
| state         | int      | 0 - 无效 1- 有效 |
| created_time  | datetime | 创建日期         |
| modified_time | datetime | 修改日期         |

电影表（movie）

| 列名          | 类型     | 说明                         |
| ------------- | -------- | ---------------------------- |
| id            | int      | 主键                         |
| title         | varchar  | 电影标题                     |
| description   | varchar  | 简要描述                     |
| detail        | text     | 详情                         |
| path          | varchar  | 电影图片存储在服务器上的路径 |
| state         | int      | 0 - 无效 1- 有效             |
| created_time  | datetime | 创建日期                     |
| modified_time | datetime | 修改日期                     |

电影类别关系表（movie_category）

| 列名        | 类型 | 说明             |
| ----------- | ---- | ---------------- |
| id          | int  | 主键             |
| movie_id    | int  | 关联movie主键    |
| category_id | int  | 关联category主键 |

RBAC三件套（user、role、menu、role_menu）

电影场次表（show_time）电影播放厅无需设计

票（ticket）

### 1.2 需求

管理员可以在该模块中，进行如下的基本操作：

- 电影类别的维护
- 电影基本信息的维护（电影的上架）
- 电影档期的安排（电影放映的排期），假定一个时间段只能放一部电影
- 放票（电影一旦预先排好期以后，就可以放票了）

#### 1.2.1 电影类别

菜单项：电影类别管理

功能：

- 类别新增、更新、删除（需要清理对应类别的电影的依赖关系，如A电影属于动作、科幻2个类别，那么删除科幻类别以后，该电影变成属于动作类别）
- 可以根据类别查询该类别下的所有电影简要信息

#### 1.2.2 电影基本信息维护

菜单项：电影基本信息管理

功能：

- 电影基本信息的新增、更新、删除
- 可以根据关键字查询电影的基本信息（关键字可以根据电影标题、内容描述进行匹配）
- 点击列表上的电影连接，可以查看该电影的详情

> 要求电影类别、电影基本信息及后续所有的主表信息的删除都为逻辑删除（增加一个状态`state`字段进行维护），而不是物理删除（删除DB中的该记录）

图片上传

前端：

如果是普通`form`提交的话，那么有如下2处注意事项：

- method：post，提交数据的大小没有限制（get是有限制的）
- enctype：multipart/form-data
- input：文件域模式 `type="file"`

jQuery

```javascript
let saveMovie = () => {
    // 获取表达数据
    const title = $("#title").val();
    const uploadPic = $("#uploadPic")[0].files[0];
    // 封装一个用来提交的数据，模拟一个传统的form标签提交
    // FormData官方文档： https://developer.mozilla.org/zh-CN/docs/Web/API/FormData/Using_FormData_Objects
    const data = new FormData();
    data.append("title", title);
    data.append("uploadPic", uploadPic);

    // 提交post请求
    $.ajax({
        url: "/movie",
        type: "post",
        data,
        processData: false,  // 不处理数据
        contentType: false,   // 不设置内容类型
        success: (data) => {
            console.log(data);
        }
    });
};
```

后端：

- 开启复合文件处理器开关

  ```xml
  <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"></bean>
  ```

- 引入`commons-fileupload`的依赖

  ```XML
          <dependency>
              <groupId>commons-fileupload</groupId>
              <artifactId>commons-fileupload</artifactId>
              <version>1.4</version>
          </dependency>
  ```

  

- 准备好参数接受

  ```JAVA
  public String saveMovie(@RequestParam("uploadPic") MultipartFile file, Movie movie, String title) {}
  ```

  当变量名称和前端提交数据时所用的key一样的时候，可以省略`@RequestParam`，SpringMVC会根据变量名与`key`相等的关系，使用`反射机制 + AOP`（拦截请求中的数据）把请求中的数据设置到方法的参数上

- 后续的处理

  - 把文件写入到服务器上的某一个路径

    ```java
    MultipartFile file;
    File dest = new File(path);
    file.transferTo(dest);
    ```

  - 设置到实体类的属性上，在DB中存入path字段

## 2. 用户端（C端）

客户表（customer）

订单表（order）
