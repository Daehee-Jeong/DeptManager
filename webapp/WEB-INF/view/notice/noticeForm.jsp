<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Timeline</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
  content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
  name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
  href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet"
  href="/resources/bower_components/bootstrap/dist/css/bootstrap-select.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
  href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
  href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
  href="/resources/dist/css/skins/_all-skins.min.css">
  
<script type="text/javascript" src="../resources/bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="../resources/bower_components/ckeditor/ckeditor.js"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<style>

textarea{
  width: 80%;
  height: 100%;
  border: none;
  resize: none;
  overflow: hidden;
}

</style>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <header class="main-header">
      <!-- Logo -->
      <a href="../../index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>LTE</span>
      </a>
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu"
          role="button"> <span class="sr-only">Toggle
            navigation</span> <span class="icon-bar"></span> <span
          class="icon-bar"></span> <span class="icon-bar"></span>
        </a>

        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- Messages: style can be found in dropdown.less-->
            <li class="dropdown messages-menu"><a href="#"
              class="dropdown-toggle" data-toggle="dropdown"> <i
                class="fa fa-envelope-o"></i> <span
                class="label label-success">4</span>
            </a>
              <ul class="dropdown-menu">
                <li class="header">You have 4 messages</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                    <li>
                      <!-- start message --> <a href="#">
                        <div class="pull-left">
                          <img src="../../dist/img/user2-160x160.jpg"
                            class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Support Team <small><i
                            class="fa fa-clock-o"></i> 5 mins</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                    </a>
                    </li>
                    <!-- end message -->
                    <li><a href="#">
                        <div class="pull-left">
                          <img src="../../dist/img/user3-128x128.jpg"
                            class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          AdminLTE Design Team <small><i
                            class="fa fa-clock-o"></i> 2 hours</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                    </a></li>
                    <li><a href="#">
                        <div class="pull-left">
                          <img src="../../dist/img/user4-128x128.jpg"
                            class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Developers <small><i
                            class="fa fa-clock-o"></i> Today</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                    </a></li>
                    <li><a href="#">
                        <div class="pull-left">
                          <img src="../../dist/img/user3-128x128.jpg"
                            class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Sales Department <small><i
                            class="fa fa-clock-o"></i> Yesterday</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                    </a></li>
                    <li><a href="#">
                        <div class="pull-left">
                          <img src="../../dist/img/user4-128x128.jpg"
                            class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Reviewers <small><i
                            class="fa fa-clock-o"></i> 2 days</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                    </a></li>
                  </ul>
                </li>
                <li class="footer"><a href="#">See All Messages</a></li>
              </ul></li>
            <!-- Notifications: style can be found in dropdown.less -->
            <li class="dropdown notifications-menu"><a href="#"
              class="dropdown-toggle" data-toggle="dropdown"> <i
                class="fa fa-bell-o"></i> <span
                class="label label-warning">10</span>
            </a>
              <ul class="dropdown-menu">
                <li class="header">You have 10 notifications</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                    <li><a href="#"> <i
                        class="fa fa-users text-aqua"></i> 5 new members
                        joined today
                    </a></li>
                    <li><a href="#"> <i
                        class="fa fa-warning text-yellow"></i> Very long
                        description here that may not fit into the page
                        and may cause design problems
                    </a></li>
                    <li><a href="#"> <i
                        class="fa fa-users text-red"></i> 5 new members
                        joined
                    </a></li>
                    <li><a href="#"> <i
                        class="fa fa-shopping-cart text-green"></i> 25
                        sales made
                    </a></li>
                    <li><a href="#"> <i
                        class="fa fa-user text-red"></i> You changed
                        your username
                    </a></li>
                  </ul>
                </li>
                <li class="footer"><a href="#">View all</a></li>
              </ul></li>
            <!-- Tasks: style can be found in dropdown.less -->
            <li class="dropdown tasks-menu"><a href="#"
              class="dropdown-toggle" data-toggle="dropdown"> <i
                class="fa fa-flag-o"></i> <span
                class="label label-danger">9</span>
            </a>
              <ul class="dropdown-menu">
                <li class="header">You have 9 tasks</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                    <li>
                      <!-- Task item --> <a href="#">
                        <h3>
                          Design some buttons <small class="pull-right">20%</small>
                        </h3>
                        <div class="progress xs">
                          <div class="progress-bar progress-bar-aqua"
                            style="width: 20%" role="progressbar"
                            aria-valuenow="20" aria-valuemin="0"
                            aria-valuemax="100">
                            <span class="sr-only">20% Complete</span>
                          </div>
                        </div>
                    </a>
                    </li>
                    <!-- end task item -->
                    <li>
                      <!-- Task item --> <a href="#">
                        <h3>
                          Create a nice theme <small class="pull-right">40%</small>
                        </h3>
                        <div class="progress xs">
                          <div class="progress-bar progress-bar-green"
                            style="width: 40%" role="progressbar"
                            aria-valuenow="20" aria-valuemin="0"
                            aria-valuemax="100">
                            <span class="sr-only">40% Complete</span>
                          </div>
                        </div>
                    </a>
                    </li>
                    <!-- end task item -->
                    <li>
                      <!-- Task item --> <a href="#">
                        <h3>
                          Some task I need to do <small
                            class="pull-right">60%</small>
                        </h3>
                        <div class="progress xs">
                          <div class="progress-bar progress-bar-red"
                            style="width: 60%" role="progressbar"
                            aria-valuenow="20" aria-valuemin="0"
                            aria-valuemax="100">
                            <span class="sr-only">60% Complete</span>
                          </div>
                        </div>
                    </a>
                    </li>
                    <!-- end task item -->
                    <li>
                      <!-- Task item --> <a href="#">
                        <h3>
                          Make beautiful transitions <small
                            class="pull-right">80%</small>
                        </h3>
                        <div class="progress xs">
                          <div class="progress-bar progress-bar-yellow"
                            style="width: 80%" role="progressbar"
                            aria-valuenow="20" aria-valuemin="0"
                            aria-valuemax="100">
                            <span class="sr-only">80% Complete</span>
                          </div>
                        </div>
                    </a>
                    </li>
                    <!-- end task item -->
                  </ul>
                </li>
                <li class="footer"><a href="#">View all tasks</a></li>
              </ul></li>
            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu"><a href="#"
              class="dropdown-toggle" data-toggle="dropdown"> <img
                src="../../dist/img/user2-160x160.jpg"
                class="user-image" alt="User Image"> <span
                class="hidden-xs">Alexander Pierce</span>
            </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header"><img
                  src="../../dist/img/user2-160x160.jpg"
                  class="img-circle" alt="User Image">

                  <p>
                    Alexander Pierce - Web Developer <small>Member
                      since Nov. 2012</small>
                  </p></li>
                <!-- Menu Body -->
                <li class="user-body">
                  <div class="row">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </div> <!-- /.row -->
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="#" class="btn btn-default btn-flat">Sign
                      out</a>
                  </div>
                </li>
              </ul></li>
            <!-- Control Sidebar Toggle Button -->
            <li><a href="#" data-toggle="control-sidebar"><i
                class="fa fa-gears"></i></a></li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
          <div class="pull-left image">
            <img src="../../dist/img/user2-160x160.jpg"
              class="img-circle" alt="User Image">
          </div>
          <div class="pull-left info">
            <p>Alexander Pierce</p>
            <a href="#"><i class="fa fa-circle text-success"></i>
              Online</a>
          </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
          <div class="input-group">
            <input type="text" name="q" class="form-control"
              placeholder="Search..."> <span
              class="input-group-btn">
              <button type="submit" name="search" id="search-btn"
                class="btn btn-flat">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
          <li class="header">MAIN NAVIGATION</li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-dashboard"></i> <span>Dashboard</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../../index.html"><i
                  class="fa fa-circle-o"></i> Dashboard v1</a></li>
              <li><a href="../../index2.html"><i
                  class="fa fa-circle-o"></i> Dashboard v2</a></li>
            </ul></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-files-o"></i> <span>Layout Options</span> <span
              class="pull-right-container"> <span
                class="label label-primary pull-right">4</span>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../layout/top-nav.html"><i
                  class="fa fa-circle-o"></i> Top Navigation</a></li>
              <li><a href="../layout/boxed.html"><i
                  class="fa fa-circle-o"></i> Boxed</a></li>
              <li><a href="../layout/fixed.html"><i
                  class="fa fa-circle-o"></i> Fixed</a></li>
              <li><a href="../layout/collapsed-sidebar.html"><i
                  class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
            </ul></li>
          <li><a href="../widgets.html"> <i class="fa fa-th"></i>
              <span>Widgets</span> <span class="pull-right-container">
                <small class="label pull-right bg-green">new</small>
            </span>
          </a></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-pie-chart"></i> <span>Charts</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../charts/chartjs.html"><i
                  class="fa fa-circle-o"></i> ChartJS</a></li>
              <li><a href="../charts/morris.html"><i
                  class="fa fa-circle-o"></i> Morris</a></li>
              <li><a href="../charts/flot.html"><i
                  class="fa fa-circle-o"></i> Flot</a></li>
              <li><a href="../charts/inline.html"><i
                  class="fa fa-circle-o"></i> Inline charts</a></li>
            </ul></li>
          <li class="treeview active"><a href="#"> <i
              class="fa fa-laptop"></i> <span>UI Elements</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="general.html"><i
                  class="fa fa-circle-o"></i> General</a></li>
              <li><a href="icons.html"><i
                  class="fa fa-circle-o"></i> Icons</a></li>
              <li><a href="buttons.html"><i
                  class="fa fa-circle-o"></i> Buttons</a></li>
              <li><a href="sliders.html"><i
                  class="fa fa-circle-o"></i> Sliders</a></li>
              <li class="active"><a href="timeline.html"><i
                  class="fa fa-circle-o"></i> Timeline</a></li>
              <li><a href="modals.html"><i
                  class="fa fa-circle-o"></i> Modals</a></li>
            </ul></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-edit"></i> <span>Forms</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../forms/general.html"><i
                  class="fa fa-circle-o"></i> General Elements</a></li>
              <li><a href="../forms/advanced.html"><i
                  class="fa fa-circle-o"></i> Advanced Elements</a></li>
              <li><a href="../forms/editors.html"><i
                  class="fa fa-circle-o"></i> Editors</a></li>
            </ul></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-table"></i> <span>Tables</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../tables/simple.html"><i
                  class="fa fa-circle-o"></i> Simple tables</a></li>
              <li><a href="../tables/data.html"><i
                  class="fa fa-circle-o"></i> Data tables</a></li>
            </ul></li>
          <li><a href="../calendar.html"> <i
              class="fa fa-calendar"></i> <span>Calendar</span> <span
              class="pull-right-container"> <small
                class="label pull-right bg-red">3</small> <small
                class="label pull-right bg-blue">17</small>
            </span>
          </a></li>
          <li><a href="../mailbox/mailbox.html"> <i
              class="fa fa-envelope"></i> <span>Mailbox</span> <span
              class="pull-right-container"> <small
                class="label pull-right bg-yellow">12</small> <small
                class="label pull-right bg-green">16</small> <small
                class="label pull-right bg-red">5</small>
            </span>
          </a></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-folder"></i> <span>Examples</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="../examples/invoice.html"><i
                  class="fa fa-circle-o"></i> Invoice</a></li>
              <li><a href="../examples/profile.html"><i
                  class="fa fa-circle-o"></i> Profile</a></li>
              <li><a href="../examples/login.html"><i
                  class="fa fa-circle-o"></i> Login</a></li>
              <li><a href="../examples/register.html"><i
                  class="fa fa-circle-o"></i> Register</a></li>
              <li><a href="../examples/lockscreen.html"><i
                  class="fa fa-circle-o"></i> Lockscreen</a></li>
              <li><a href="../examples/404.html"><i
                  class="fa fa-circle-o"></i> 404 Error</a></li>
              <li><a href="../examples/500.html"><i
                  class="fa fa-circle-o"></i> 500 Error</a></li>
              <li><a href="../examples/blank.html"><i
                  class="fa fa-circle-o"></i> Blank Page</a></li>
              <li><a href="../examples/pace.html"><i
                  class="fa fa-circle-o"></i> Pace Page</a></li>
            </ul></li>
          <li class="treeview"><a href="#"> <i
              class="fa fa-share"></i> <span>Multilevel</span> <span
              class="pull-right-container"> <i
                class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
              <li><a href="#"><i class="fa fa-circle-o"></i>
                  Level One</a></li>
              <li class="treeview"><a href="#"><i
                  class="fa fa-circle-o"></i> Level One <span
                  class="pull-right-container"> <i
                    class="fa fa-angle-left pull-right"></i>
                </span> </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i>
                      Level Two</a></li>
                  <li class="treeview"><a href="#"><i
                      class="fa fa-circle-o"></i> Level Two <span
                      class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
                    </span> </a>
                    <ul class="treeview-menu">
                      <li><a href="#"><i class="fa fa-circle-o"></i>
                          Level Three</a></li>
                      <li><a href="#"><i class="fa fa-circle-o"></i>
                          Level Three</a></li>
                    </ul></li>
                </ul></li>
              <li><a href="#"><i class="fa fa-circle-o"></i>
                  Level One</a></li>
            </ul></li>
          <li><a href="https://adminlte.io/docs"><i
              class="fa fa-book"></i> <span>Documentation</span></a></li>
          <li class="header">LABELS</li>
          <li><a href="#"><i class="fa fa-circle-o text-red"></i>
              <span>Important</span></a></li>
          <li><a href="#"><i class="fa fa-circle-o text-yellow"></i>
              <span>Warning</span></a></li>
          <li><a href="#"><i class="fa fa-circle-o text-aqua"></i>
              <span>Information</span></a></li>
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
      
        <h1>
          Timeline <small>example</small>
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
          <li><a href="#">UI</a></li>
          <li class="active">Timeline</li>
        </ol>
      </section>
      
      <!--  Modal  -->
      <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
                Launch Default Modal
      </button>
      
       <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                   
               
                  <h4> 공지 등록 </h4>
                  
        
                  <div class="form-inline">
                  <div class="input-group" style="padding:10px;"> 
                   
                    
                    <select id="type" name="sel1" class="selectpicker" data-style="btn-info">
                     <option selected data-content="<span class='glyphicon glyphicon-envelope'></span>" value="1">일반</option>
                      <option data-content="<span class='glyphicon glyphicon-warning-sign'></span>" value="2">학사</option>
                      <option data-content="<span class='glyphicon glyphicon-education'></span>" value="3">긴급</option>
                    </select>
                    
                    <select id="target" name="sel2" class="selectpicker" data-style="btn-primary">
                      <option selected value="0">전체</option>
                      <option value="1">1학년</option>
                      <option value="2">2학년</option>
                      <option value="3">3학년</option>
                      <option value="4">4학년</option>
                      <option value="5">대학원</option>
                     </select>
                     <!-- HTML to write -->

                     
                   <input type="text" id="title" title="제목이 빈칸일 수 없습니다." class="form-control col-md-7" placeholder="공지 이름입력" required>
                    
                    </div>
                </div>
      
              </div>
              <div class="modal-body">
                <p id="tootlip-contents" title="내용이 빈칸일 수 없습니다."> <textarea name="contents" id="contents" style="width: 90%; height: 700px;"></textarea></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button id="create-btn" type="button" data-dismiss="modal" class="btn btn-primary">Save changes</button>
                
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

     

      <!-- Main content -->
      <section class="content">

        <!-- row -->
        <div class="row">
          <div class="col-md-12" id="notice">
       
            
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

            
              
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->

      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
      <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
      </div>
      <strong>Copyright &copy; 2014-2016 <a
        href="https://adminlte.io">Almsaeed Studio</a>.
      </strong> All rights reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Create the tabs -->
      <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
            class="fa fa-home"></i></a></li>

        <li><a href="#control-sidebar-settings-tab"
          data-toggle="tab"><i class="fa fa-gears"></i></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
        <!-- Home tab content -->
        <div class="tab-pane" id="control-sidebar-home-tab">
          <h3 class="control-sidebar-heading">Recent Activity</h3>
          <ul class="control-sidebar-menu">
            <li><a href="javascript:void(0)"> <i
                class="menu-icon fa fa-birthday-cake bg-red"></i>

                <div class="menu-info">
                  <h4 class="control-sidebar-subheading">Langdon's
                    Birthday</h4>

                  <p>Will be 23 on April 24th</p>
                </div>
            </a></li>
            <li><a href="javascript:void(0)"> <i
                class="menu-icon fa fa-user bg-yellow"></i>

                <div class="menu-info">
                  <h4 class="control-sidebar-subheading">Frodo
                    Updated His Profile</h4>

                  <p>New phone +1(800)555-1234</p>
                </div>
            </a></li>
            <li><a href="javascript:void(0)"> <i
                class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                <div class="menu-info">
                  <h4 class="control-sidebar-subheading">Nora
                    Joined Mailing List</h4>

                  <p>nora@example.com</p>
                </div>
            </a></li>
            <li><a href="javascript:void(0)"> <i
                class="menu-icon fa fa-file-code-o bg-green"></i>

                <div class="menu-info">
                  <h4 class="control-sidebar-subheading">Cron Job
                    254 Executed</h4>

                  <p>Execution time 5 seconds</p>
                </div>
            </a></li>
          </ul>
          <!-- /.control-sidebar-menu -->

          <h3 class="control-sidebar-heading">Tasks Progress</h3>
          <ul class="control-sidebar-menu">
            <li><a href="javascript:void(0)">
                <h4 class="control-sidebar-subheading">
                  Custom Template Design <span
                    class="label label-danger pull-right">70%</span>
                </h4>

                <div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-danger"
                    style="width: 70%"></div>
                </div>
            </a></li>
            <li><a href="javascript:void(0)">
                <h4 class="control-sidebar-subheading">
                  Update Resume <span
                    class="label label-success pull-right">95%</span>
                </h4>

                <div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-success"
                    style="width: 95%"></div>
                </div>
            </a></li>
            <li><a href="javascript:void(0)">
                <h4 class="control-sidebar-subheading">
                  Laravel Integration <span
                    class="label label-warning pull-right">50%</span>
                </h4>

                <div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-warning"
                    style="width: 50%"></div>
                </div>
            </a></li>
            <li><a href="javascript:void(0)">
                <h4 class="control-sidebar-subheading">
                  Back End Framework <span
                    class="label label-primary pull-right">68%</span>
                </h4>

                <div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-primary"
                    style="width: 68%"></div>
                </div>
            </a></li>
          </ul>
          <!-- /.control-sidebar-menu -->

        </div>
        <!-- /.tab-pane -->
        <!-- Stats tab content -->
        <div class="tab-pane" id="control-sidebar-stats-tab">Stats
          Tab Content</div>
        <!-- /.tab-pane -->
        <!-- Settings tab content -->
        <div class="tab-pane" id="control-sidebar-settings-tab">
          <form method="post">
            <h3 class="control-sidebar-heading">General Settings</h3>

            <div class="form-group">
              <label class="control-sidebar-subheading"> Report
                panel usage <input type="checkbox" class="pull-right"
                checked>
              </label>

              <p>Some information about this general settings option
              </p>
            </div>
            <!-- /.form-group -->

            <div class="form-group">
              <label class="control-sidebar-subheading"> Allow
                mail redirect <input type="checkbox" class="pull-right"
                checked>
              </label>

              <p>Other sets of options are available</p>
            </div>
            <!-- /.form-group -->

            <div class="form-group">
              <label class="control-sidebar-subheading"> Expose
                author name in posts <input type="checkbox"
                class="pull-right" checked>
              </label>

              <p>Allow the user to show his name in blog posts</p>
            </div>
            <!-- /.form-group -->

            <h3 class="control-sidebar-heading">Chat Settings</h3>

            <div class="form-group">
              <label class="control-sidebar-subheading"> Show me
                as online <input type="checkbox" class="pull-right"
                checked>
              </label>
            </div>
            <!-- /.form-group -->

            <div class="form-group">
              <label class="control-sidebar-subheading"> Turn
                off notifications <input type="checkbox"
                class="pull-right">
              </label>
            </div>
            <!-- /.form-group -->

            <div class="form-group">
              <label class="control-sidebar-subheading"> Delete
                chat history <a href="javascript:void(0)"
                class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
              </label>
            </div>
            <!-- /.form-group -->
          </form>
        </div>
        <!-- /.tab-pane -->
      </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

  <!-- jQuery 3 -->
  <script src="/resources/bower_components/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script
    src="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="/resources/bower_components/fastclick/lib/fastclick.js"></script>
    <script src="/resources/bower_components/moment/moment.js"></script>
  <!-- AdminLTE App -->
  <script src="/resources/dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="/resources/dist/js/demo.js"></script>
<script type="text/javascript" src="../resources/bower_components/bootstrap/js/bootstrap-select.js"></script>
  <script type="text/javascript">
   var scrollCount = 1; 
	var preDate = '';
	var ul;
	
	
	$(document).ready(function() {
		$(".selectpicker").selectpicker();
		CKEDITOR.replace(
				'contents',
				{
					'filebrowserUploadUrl' : '${contextPath}/notice/imageUpload.do'
				});
		
		$("#create-btn").click(createButtonEvent);
	
		loadPage();
		
		console.log($('.timeline-footer').child);
		
		$(document).scroll(function() {
			maxHeight = $(document).height();
			currentScroll = $(window).scrollTop() + $(window).height();
			
			if (maxHeight <= currentScroll) {	
				scrollCount++;
				loadPage();
			}
		});
		

	});
	
	loadPage = function() {
		console.log(scrollCount);
  		var notice = $("#notice");

  		$.ajax({
  			type : 'POST',
  			url : '/notice/selectNoticeListProc.do',
  			data : {
  				"page" : String(scrollCount),
  			},
  			dataType : 'json',
  			success : function(data) {
  				if (data.result == 'success') {
        				console.log(data);
        				
        				var list = data.mList;
        				
        				for(var i in list) {
        					var noticeDate = list[i].noticeDate.split(' ');

        					var date = noticeDate[0];
        					var time = noticeDate[1];
        							
        					if(date != preDate) {
        						notice.append(createTimeLine(date));
        						preDate = date;
        								
        						if(ul != undefined) ul = ul.next();
        						else ul=$("#notice").children().first();
        					}
        						
        					ul.append(createLabel(list[i].noticeNo, time, list[i].noticeTitle, list[i].noticeContent, list[i].noticeType, list[i].noticeTarget));
        				
        					$('button[type="button"]').on("click", function(event) {
        						 event.preventDefault();
        						 console.log(event);
        					})
        				}
        				
        				$('button[name="delete"]').click(function(event) {
        					var no = $(this).attr("id");
        					
        				 	$.ajax({
        			  			type : 'POST',
        			  			url : '/notice/deleteNoticeProc.do',
        			  			data : {
        			  				"noticeNo" : no
        			  			},
        			  			dataType : 'json',
        			  			success : function(data) {
        			  				console.log(data);
        			  				$("#"+no).parent().parent().parent().hide();
        			  			}
        					}); 
        				})
  				}
  					
  				else {
  					alert("endPage")
  				} 
  				
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
				}
		});
	}
	
	/* TimeLine 소속되는 Label을 만드는 메소드
	 * Label -> 하나의 공지
	 * time -> 게시된 시:분:초
	 * type -> 공지의 분류
	 * target -> 공지대상                                 */
	createLabel = function(no, time, title, content, type, target) {
		var typeIcon;
		var targetIcon;
		 
		 
		/* 1 -> 일반 메세지 모양 
		 * 2 -> 학사모 모양
		 * 3 -> 
		*/
		switch(type) {
		case '1':
			typeIcon = "fa fa-envelope bg-blue";
			break;
		case '2':
			typeIcon = "fa fa-warning bg-red";
			break;
		case '3':
			typeIcon = "fa fa-mortar-board bg-black";
			break;
		default:
			typeIcon = "fa fa-envelope bg-blue";
			break;
		} 
		
		
		 
		var str = 
		"            <!-- timeline item -->\r\n" + 
		"            <li>\r\n" + 
		"              <i class=\"" + typeIcon + "\"></i>\r\n" + 
		"\r\n" + 
		"              <div class=\"timeline-item\">\r\n" + 
		"                <span class=\"time\"><i class=\"fa fa-clock-o\"></i>"+ time.split(".")[0] + "</span>\r\n" + 
		"\r\n" + 
		"                <h3 class=\"timeline-header\">" + title + "</h3>\r\n" + 
		"\r\n" + 
		"                <div class=\"timeline-body\">\r\n" + 
		"                 " + content +   
		"                </div>\r\n" + 
		"                <div class=\"timeline-footer\">\r\n" + 
		"                  <a class=\"btn btn-primary btn-xs\">Read more</a>\r\n" + 
		"                  <button tpye=\"button\" id=\""+no+"\" name=\"delete\" class=\"btn btn-danger btn-xs\">Delete</button>\r\n" + 
		"                </div>\r\n" + 
		"              </div>\r\n" + 
		"            </li>";
			
		return str;
	}
			
	createTimeLine = function(date) {
		var str = "<ul class=\"timeline\" id=\"" + date.trim() + "\">" +
				
					 "	<li class=\"time-label\">\r\n" + 
					 "     <span class=\"bg-red\">\r\n" + 
					 			date + 
					 "     </span>\r\n" + 
					 "	</li>" +
					"</ul>";
							
		return str;
	}
	
	createButtonEvent = function() {
		if($("#title").val().length < 1) {
			$("#title").tooltip('show');
			
			setTimeout(function() {
				$("#title").tooltip('destroy');
				},2000)
			
			return false;
		}
		
		if(CKEDITOR.instances.contents.getData().trim().length < 1) {
			$("#tootlip-contents").tooltip("show");
			
			setTimeout(function() {
				$("#tootlip-contents").tooltip('destroy');
				},2000)

			
			return false;
		}
		
		console.log( $("#target").val());
		console.log( $("#type").val()); 
		
		$.ajax({
  			type : 'POST',
  			url : '/notice/insertNoticeProc.do',
  			data : {
  				"noticeTitle" : $("#title").val(),
  				"noticeContent" : CKEDITOR.instances.contents.getData(),
  				"noticeType" : $("#type").val(),
  				"noticeTarget" : $("#target").val()
  			},
  			dataType : 'json',
  			success : function(data) {
  				if (data.result == 'success') {
        				console.log(data);
        				var today = moment().format("YYYY-MM-DD");
        				
        				if($("#"+today) == undefined) {
        					createTimeLine(today);
        				}
        				
        				
        				$(createLabel("방금", $("#title").val(), CKEDITOR.instances.contents.getData(), $("#type").val(), $("#target").val())).insertAfter("#"+today+ " li:nth-child(1)");
        				
        				$("#title").val("");
        				CKEDITOR.instances.contents.setData("");
        				$('select[name=sel1]').val(1);
        				$('select[name=sel2]').val(0);
        				$('.selectpicker').selectpicker('refresh')
        				
        				
        				
        				/* var list = data.mList;
        				
        				for(var i in list) {
        					var noticeDate = list[i].noticeDate.split(' ');
        							
        					var date = noticeDate[0];
        					var time = noticeDate[1];
        							
        					if(date != preDate) {
        						notice.append(createTimeLine(date));
        						preDate = date;
        								
        						if(ul != undefined) ul = ul.next();
        						else ul=$("#notice").children().first();
        					}
        						
        					console.log($("#notice").children().first());
        					ul.append(createLabel(time, list[i].noticeTitle, list[i].noticeContent, list[i].noticeType, list[i].noticeTarget)); */
        				
  				}	
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " + status
						+ ", error : " + error);
				}
		});
	}
		
	deleteBtnEvent = function(event) {
		console.log("event");
		console.log(this);
	}
</script>
</body>
</html>
