<%-- 
    Document   : User_Lists
    Created on : 15/jun/2017, 15:54:17
    Author     : Utilizador
--%>

<%@page import="java.util.Random"%>
<%@page import="moviedb_classes.Ratings"%>
<%@page import="moviedb_classes.Movie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="moviedb_classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="favicon.ico">

        <title>MovieDB</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/user_lists.css" rel="stylesheet">
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->

    </head>
    <body>

        <%System.out.println("entrei no jsp");
            User u = (User) request.getAttribute("user");
            System.out.println(u.getUsername());%>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <% String ref="LoginServlet?log_state=1&username="+u.getUsername();%>
                    <a class="navbar-brand" href=<%=ref%>>
                        <img class="img-fluid" alt="MovieDB" src="images/logo.jpg" width="50" height="100">
                    </a>
                    <a class="navbar-brand" href="<%=ref%>" style="padding-top:15px">
                        MovieDB
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <img class="img-circle" src=<%=u.getAvatar()%> >
                        </li>
                        <li><p class="navbar-text">Hello,</p></li>
                        <li class="dropdown ">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b><%=u.getUsername()%></b> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li>
                                <li><a href="homepage_logedout">Log out</a></li>
                        </li>
                    </ul>
                    </li>
                    </ul>
                    <form method="POST" action="Search_Servlet" class="navbar-form" id="search">
                            <div class="form-group" style="display:inline;">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="movie_title" placeholder="Search movie title">
                                    <input type="hidden" name="user" value="<%=u.getId()%>" />
                                    <span class="input-group-addon">
                                    <button type="submit" class="submit-with-icon icon-button">
                                            <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                    </span>
                                </div>
                            </div>
                        </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
                            

        <div style="padding-top:100px;" class="container">
            <div class="row">

                <% String list_name = request.getAttribute("list_name").toString();
                System.out.println(list_name);
                int bot_limit=(int) request.getAttribute("bot_limit");
                System.out.println(bot_limit);%>
                    
                <div class="col-md-10 col-md-offset-1">

                    <div class="panel panel-default panel-table">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col col-xs-6">
                                    <h2 class="panel-title"><p><strong><%=list_name%></strong></p></h2>
                                </div>
                                <div class="pull-right" style="padding-right: 15px">
                                <form method="POST" action="Remove_List_Servlet">
                                    <input type="submit" name="delete" class="btn btn-default" value="Delete list">
                                    <input type="hidden" name="userid" value="<%= u.getId()%>">
                                    <input type="hidden" name="username" value="<%= u.getUsername()%>">
                                    <input type="hidden" name="list_name" value="<%=list_name.replace(" ", "_")%>">
                                </form>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-list">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Poster</th>
                                        <th>Title</th>
                                        <th>Rating</th>
                                        <th>       </th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <% List<Movie> movies = (List) request.getAttribute("list");
                          int start_point = (int) request.getAttribute("start");
                          for (Movie m : movies) {%>
                                    <tr>
                                        <td>
                                            <strong><%=start_point + 1%></strong>
                                        </td>
                                        <td><a href="<%="/MovieDB3/movie_details?id="+m.getId()+"&user="+u.getId()%>" class="thumbnail small-poster"><img src=<%=m.getPoster()%> alt="Image"></a></td>
                                        <td><a href="<%="/MovieDB3/movie_details?id="+m.getId()+"&user="+u.getId()%>"><%=m.getTitle()%></a> </td>
                                        <td><div class="star-ratings-css">
                                                <div class="star-ratings-css"><span style="color: #000"><%=m.getRating()%>  <span style="color: #FF6701">★</span></span></div>
                                            </div>
                                        </td>
                                        <% Random rn= new Random();%>
                                        <% ref= "RemoveEntryServlet?user_id="+u.getId()+"&movie_id="+m.getId()+"&list_name="+list_name.replace(" ","_")+"&user="+u.getUsername()+"&bot_limit="+bot_limit;%>
                                        <td><a href=<%=ref%>>remove</a></td>
                                    </tr>
                                    <%start_point++;} %>
                                </tbody>
                            </table>

                        </div>
                        <div class="panel-footer" style="text-align:center">
                            <div class="row">
                               <%if(bot_limit!=0){
                               ref="User_Lists_Servlet?list_name="+list_name.replace(" ", "_")+"&bot_limit="+(bot_limit-20)+"&user="+u.getUsername();%>
                                
                               <a href="<%=ref%>"  class="btn btn-primary btn-lg" role="button" title="Click for more results" data-toggle="tooltip" data-placement="left">Previous 20</a>
                               <%}%>
                               <%if(!(movies.size()<20)){
                               ref="User_Lists_Servlet?list_name="+list_name.replace(" ", "_")+"&bot_limit="+start_point+"&user="+u.getUsername();%>
                               <a href="<%=ref%>"  class="btn btn-primary btn-lg" role="button" title="Click for more results" data-toggle="tooltip" data-placement="left">Next 20    </a> 
                               <%}%>
                            </div>
                        </div>
                    </div>

                </div>
                    <a id="back-to-top"  href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
            </div></div>




        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="js/loged_in.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
