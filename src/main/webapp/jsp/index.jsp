<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.hand.POJO.Customer"%>
<%@page import="com.hand.Dao.CustomerDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style1.css">
</head>
<body>
<div class="container">
    <div class="head">
       <a class="btn btn-primary" href="<%= request.getContextPath() %>/logout.action">退出</a>
    </div>
   <div class="body">
       <div class="menu">
           <ul id="mytab" class="nav nav-tabs nav-stacked" role="tablist">
               <li role="presentation" class=""><a href="#">Customer管理<span class="glyphicon glyphicon-chevron-right"></span></a> </li>
               <li role="presentation"><a href="#">Film设置<span class="glyphicon glyphicon-chevron-right"></span></a> </li>
           </ul>
       </div>
       <div class="kehuguanli">
           <div class="cust">
             <h3>  客户管理</h3>
           </div>

				<div class="panel panel-info">
					<div class="panel-heading">
						<div>客户列表</div>
						<button type="button" class="btn btn-primary col-md-offset-4" data-toggle="modal" data-target="#exampleModal"data-whatever="@mdo">新建</button>
     

					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<thead>
									<tr class="active">
										<th>操作</th>
										<th>Frist Name</th>
										<th>Last Name</th>
										<th>Address</th>
										<th>Email</th>
										<th>Customer_ID</th>
										<th>LastUpdate</th>
									</tr>
								</thead>
								<tbody>
									 <%
									CustomerDao customerDao = new CustomerDao();
									 /* List customer = customerDao.select(); */
									
									  for (Iterator iterator = 
											  customerDao.select().iterator(); iterator.hasNext();){
					            Customer customers = (Customer) iterator.next(); 
					           %>
					          <tr class="success">
										 <td>
										 <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateModal">编辑</button>
										 
										 <!--          编辑模态框 -->
											<div class="modal fade" id="updateModal" tabindex="-1"
												role="dialog" aria-labelledby="exampleModal"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h4 class="modal-title" id="exampleModalLable">Update
																Customer</h4>
														</div>
														<div class="modal-body">
															<form class="form-horizontal" role="form"
																action="<%=request.getContextPath()%>/doCustomer_update!update.action"
																Method="post">

																<div class="form-group">
																	<label class="col-md-4 control-label">ID：</label>
																	<div class="col-md-4">
																		<input type="text" name="delet_id"
																			value="<%=customers.getId()%>" class="form-control "
																			disabled>
																	</div>
																</div>

																<div class="form-group">
																	<label class="col-md-4 control-label">Frist
																		Name：</label>
																	<div class="col-md-4">
																		<input type="text" name="first_name"
																			class="form-control" placeholder="Frist Name">
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-md-4 control-label">Last
																		Name：</label>
																	<div class="col-md-4">
																		<input type="text" name="last_name"
																			class="form-control" placeholder="Last Name">
																	</div>
																</div>
																<div class="form-group">
																	<label class="col-md-4 control-label">Email：</label>
																	<div class="col-md-4">
																		<input type="text" name="email" class="form-control"
																			placeholder="Email">
																	</div>
																</div>

																<div class="form-group">
																	<label class="col-md-4 control-label">Address：</label>
																	<div class="dropdown">
																		<select class="btn btn-default" id="dlabel"
																			name="address_id" type="button"
																			data-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																			<option value="4">4</option>
																		</select>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-offset-4 col-md-4">
																		<button type="submit" class="btn btn-default">更新</button>
																		<button type="submit" class="btn btn-default">取消</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											 <a class="btn btn-primary btn-sm"
											name="delet_id"
											href="<%= request.getContextPath() %>/doCustomer_delet!delet.action?delet_id=<%=customers.getId()%>"
											>删除</a> 
											
											</td>

										<td><input disabled type="text" name="first_name"
											value="<%=customers.getFirst_name()%>" /></td>
										<td><input disabled type="text" name="last_name"
											value="<%=customers.getLast_name()%>" /></td>
										<td><input disabled type="text" name="address"
											value="<%=customers.getAddress_id()%>" /></td>
										<td><input disabled type="text" name="email"
											value="<%=customers.getEmail()%>" /></td>
										<td><input disabled type="text" name="customer_id"
											value="<%=customers.getId()%>" /></td>
										<td><input disabled type="text" name="last_update"
											value="<%=customers.getLastupdate()%>" /></td> 
									</tr> 
					           <%
					         }
							 %>  
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-footer">
						<div class="fenpage">
							<nav class="bottom_nav">
							<ul class="pagination">
								<li><a href="index.jsp?curpage=1">&laquo;</a></li>
								
<%-- 								<li><a href="index.jsp?curpage=<%=i%>"><%=i%></a></li>
								<li><a href="index.jsp?curpage=<%=pagecount%>">&raquo;</a> --%>
								</li>
							</ul>
							</nav>
						</div>
					</div>
				</div>

			</div>
   </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModal"
             aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                     <h4 class="modal-title" id="exampleModalLable">New Customer</h4>
                 </div>
                 <div class="modal-body">
                <form class="form-horizontal" role="form" action="<%=request.getContextPath() %>/doCustomer_add!add.action" Method="post" name="loginForm">
                    <div class="form-group">
                        <label class="col-md-4 control-label">Frist Name：</label>
                        <div class="col-md-4">
                            <input type="text" name="first_name" class="form-control" placeholder="Frist Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Last Name：</label>
                        <div class="col-md-4">
                            <input type="text" name="last_name" class="form-control" placeholder="Last Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Email：</label>
                        <div class="col-md-4">
                            <input type="text" name="email" class="form-control" placeholder="Email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label">Address：</label>
                        <div class="dropdown">
								<!-- <button class="btn btn-default" id="dlabel" name="address_id" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Address
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li><a value="1" class="active">1</a></li>
                                <li><a value="2">2</a></li>
                                <li><a value="3">3</a></li>
                                <li><a value="4">4</a></li>
                                <li><a value="5">5</a></li>
                            </ul> -->
								<select class="btn btn-default" id="dlabel" name="address_id" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-md-4">
                            <button type="submit" class="btn btn-default">新建</button>
                            <button type="submit" class="btn btn-default">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
             </div>
         </div>

         
     </div>
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="AJAX.js"></script>
</body>
</html>