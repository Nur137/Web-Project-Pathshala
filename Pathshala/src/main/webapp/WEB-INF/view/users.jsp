<%-- 
    Document   : index
    Created on : Dec 23, 2017, 10:40:42 AM
    Author     : Asif Ahmed
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
        <s:url var="url_css" value="/static/css/style.css" />
        <link href="${url_css}" rel="stylesheet" type="text/css"/>
        <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
        <script src = "${url_jqlib}"></script>
        <script>
            function changeStatus(uid, lstatus){
                //alert(userId+", "+loginStatus);
                $.ajax({
                    url:'change_status',
                    data:{userId:uid, loginStatus:lstatus} ,
                    success: function (data) {  
                        alert(data);
                    }
                });
            }
        </script>
    </head>
    <s:url var="url_bg" value="/static/images/bg.jpg" />
    <body>
        <table border="1" width="80%" align="center">
            <tr>
                <td height="100px">
                    <%-- Header --%>
                    <jsp:include page="include/header.jsp"/>
                </td>
            </tr>
             <tr>
                <td height="25px">
                    <%-- Menu --%>
                       <jsp:include page="include/menu.jsp"/>
                </td>
            </tr>
             <tr>
                <td height="350px" valign="top">
                    <%-- Page Content Area --%>
                    <h1>User List</h1>
                    TODO : User List
                    <table border="1">
                        <tr>
                            <td>SR</td>
                            <td>USER ID</td>
                            <td>Name</td>
                            <td>Phone</td>
                            <td>Email</td>
                            <td>Address</td>
                            <td>Username</td>
                            <td>Status</td>     
                            
                              
                        </tr>
                        <c:forEach var="u" items="${userList}" varStatus="st">
                             <tr>
                            <td>${st.count}</td>
                            <td>${u.userId}</td>
                            <td>${u.name}</td>
                            <td>${u.phone}</td>
                            <td>${u.email}</td>
                            <td>${u.address}</td>
                            <td>${u.loginName}</td>
                            <td>
                                
                                <select id="id_${u.userId}" onchange="changeStatus(${u.userId},$(this).val())">
                                    <option value="1"> Active</option>
                                    <option value="2">Block</option>
                                </select>
                                    <script>
                                        $('#id_${u.userId}').val(${u.loginStatus});
                                    </script>
                            </td>     
                            
                              
                        </tr>
                        </c:forEach>
                    </table>
                </td>
            </tr>
             <tr>
                <td height="100px">
                    <%-- footer --%>
                    Fuck fuck fuck
                </td>
            </tr>
        </table>
    </body>
</html>
