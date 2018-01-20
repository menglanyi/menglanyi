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
    <title>员工列表</title>
    <% pageContext.setAttribute("App_path",request.getContextPath());%>
    <meta charset="utf-8">
    <script src="${App_path}/static/bootstrap-3.3.7-dist/js/jquery.js"></script>
    <link href="${App_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${App_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


</head>

<body>
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">SSM_CRUD</div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-sm">新增</button>
            <button class="btn btn-danger btn-sm">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-hover table-bordered">
                <tr>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                修改</button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除</button>

                    </c:forEach>
                        </th>
                </tr>
            </table>
        </div>
    </div>
    <!--显示分页信息栏-->
    <div class="row">
        <div class="col-md-6">
            当前${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录

        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${App_path}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${App_path}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum==pageInfo.pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum!=pageInfo.pageNum}">
                            <li ><a href="${App_path}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${App_path}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                    <li><a href="${App_path}/emps?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
