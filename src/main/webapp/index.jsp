<%--
  Created by IntelliJ IDEA.
  User: 梦蓝忆
  Date: 2018/1/18
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="${App_path}/static/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <title>员工列表</title>
    <% pageContext.setAttribute("App_path",request.getContextPath());%>
    <meta charset="utf-8">
    <link href="${App_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${App_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


</head>

<body>
<!--员工修改的模态框-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                           <p class="form-control-static" id="empName_input_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_input_update" placeholder="5645633@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_input_update" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_input_update" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                          <label><select class="form-control" name="dId" id="dept_select_update"></select></label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update">修改</button>
            </div>
        </div>
    </div>
</div>

<!--员工添加的模态框-->
<div class="modal fade" id="empAndModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_input" placeholder="5645633@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                          <label><select class="form-control" name="dId" id="dept_select"></select></label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add">保存</button>
            </div>
        </div>
    </div>
</div>




<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">SSM_CRUD</div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-lg" id="emp_add_model_btn">新增</button>
            <button class="btn btn-danger btn-lg" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-hover table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <label>    <input type="checkbox" id="check_all"/></label>
                    </th>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!--显示分页信息栏-->
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script>
    var totalRecoder,currentPage;
    $(function () {
        to_page(1);
    });
    function build_emps_table(result) {
        //清空表格数据
        $("#emps_table tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var nameTd=$("<td></td>").append(item.empName);
            var gender=item.gender=='M'?"男":"女";
            var genderTd=$("<td></td>").append(gender);
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit-btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.empId);
            var deleteBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete-btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-trash")).append("删除");
            deleteBtn.attr("delete-id",item.empId);
            var btnTd=$("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd).append(nameTd).append(genderTd).append(emailTd).append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });

    }
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append(" 当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页," +
            "总"+result.extend.pageInfo.total+"条记录");
        totalRecoder=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        if(result.extend.pageInfo.hasNextPage==false){
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            })
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }
    function to_page(pn) {

        $.ajax({
            url:"${App_path}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }
    $("#emp_add_model_btn").click(function () {
        reset_form("#empAndModal form");
        getDepts("#dept_select");
        $("#empAndModal").modal({
           backdrop:"static"
        });
    });
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-erroe has-success");
        $(ele).find(".help-block").text("");
    }
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${App_path}/depts",
            type:"GET",
            success:function (result) {
                // $("#dept_select").append()
                $.each(result.extend.depts,function () {
                    var option=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    option.appendTo(ele);
                });
            }
        });
    }
    function validata_add_form() {
        //1拿到要校验的数据
        var empName=$("#empName_input").val();
        var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            //alert("用户名不对");
            show_validata_msg("#empName_input","error","用户名不对");
            return false;
        }else {
            show_validata_msg("#empName_input","success","");
        }


        var email=$("#email_input").val();
        var regemail=/^([a-z0-9_\\.-]+)@([\da-z\\.-]+)\.([a-z\\.]{2,6})$/;
        if(!regemail.test(email)){
            //alert("邮箱不对");
            show_validata_msg("#email_input","error","邮箱不对");

            return false;
        }else {
            show_validata_msg("#email_input","success","");
        }
        return true;
    }
    function show_validata_msg(ele,status,msg) {
        //清楚当前元素校验状态
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_input").change(function(){
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${App_path}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validata_msg("#empName_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validata_msg("#empName_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });
    $("#emp_add").click(function () {

        if(!validata_add_form()){
            return false;
        }

        if($(this).attr("ajax-va")=="error"){
            return false;
        }
            $.ajax({
                url:"${App_path}/emp",
                type:"POST",
                data:$("#empAndModal form").serialize(),
                success:function (result) {
                    if(result.code==100){
                        $("#empAndModal").modal('hide');
                        to_page(totalRecoder);
                    }else {
                        if(undefined==result.extend.errorFields.email);{
                            show_validata_msg("#email_input","error",result.extend.errorFields.email);
                        }
                        if(undefined==result.extend.errorFields.empName);{
                            show_validata_msg("#empName_input","error",result.extend.errorFields.empName);
                        }
                    }

                }
            });

    });

    $(document).on("click",".delete-btn",function () {
      var empName= $(this).parents("tr").find("td:eq(2)").text();
      var empId=$(this).attr("delete-id");
      if(confirm("确认删除【"+empName+"】吗")){
          $.ajax({
              url:"${App_path}/emp/"+empId,
              type:"DELETE",
              success:function (result) {
                  alert(result.extend.msg);
                  to_page(currentPage);
              }
          });
      }
    });
    $(document).on("click",".edit-btn",function () {

        getDepts("#empUpdateModal select");
        getEmp($(this).attr("edit-id"));
        $("#emp_update").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
        backdrop:"static"
    });
    });
    function getEmp(id) {
        $.ajax({
            url:"${App_path}/emp/"+id,
            type:"GET",
            success:function (result) {
                var empData=result.extend.emp;
                $("#empName_input_update_static").text(empData.empName);
                $("#email_input_update").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }
    $("#emp_update").click(function () {

        var email=$("#email_input_update").val();
        var regemail=/^([a-z0-9_\\.-]+)@([\da-z\\.-]+)\.([a-z\\.]{2,6})$/;
        if(!regemail.test(email)){
            //alert("邮箱不对");
            show_validata_msg("#email_input_update","error","邮箱不对");

            return false;
        }else {
            show_validata_msg("#email_input_update","success","");
        }

        $.ajax({
            url:"${App_path}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),<!--+"&_method=PUT",-->
            success:function () {
                    $("#empUpdateModal").modal("hide");
                    to_page(currentPage);
            }
        })
    });
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function () {
        var flage=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flage);
    });

    $("#emp_delete_all_btn").click(function () {
        var emps="";
        var del_idste="";
        $.each($(".check_item:checked"),function () {

          emps+= $(this).parents("tr").find("td:eq(2)").text()+",";
          del_idste+= $(this).parents("tr").find("td:eq(1)").text()+"-";
        });

        emps.substring(0,emps.length-1);
        del_idste.substring(0,del_idste.length-1);
        if(confirm("确认删除【"+emps+"】吗")){
            $.ajax({
                url:"${App_path}/emp/"+del_idste,
                type:"DELETE",
                success:function (result) {
                    alert(result.extend.msg);
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
