<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.*, java.io.*, information.TaskInfo, information.ProjectInfo" %>
    <%@ page import="java.text.SimpleDateFormat" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <% Date currentDate=new Date(); SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy HH:mm"); String
          formattedDate=dateFormat.format(currentDate); ArrayList<TaskInfo> arr = (ArrayList<TaskInfo>)
            request.getAttribute("arrayListTask");
            int projectId = (int) request.getAttribute("projectId");
            ProjectInfo projectInfo = (ProjectInfo) request.getAttribute("projectInfo"); %>

            <title>
              <%= projectInfo.projectName %>
            </title>

            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />

            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              rel="stylesheet" />

            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
              rel="stylesheet" />

            <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" />

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />

            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
              integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
              crossorigin="anonymous" />


            <link rel="stylesheet" type="text/css" href="./css/style.css" />
            <link rel="stylesheet" type="text/css" href="./css/todo.css" />

      </head>

      <body>
        <jsp:include page="components/header.jsp" />

        <div class="container-todo d-flex justify-content-center py-2">
          <div class="col-md-8">
            <div class="d-flex align-items-center justify-content-between">
              <p class="mb-2 flex-grow-1">
                <span class="h3 me-2">
                  <%= projectInfo.projectName %>
                </span>
                <% if(projectInfo.priority.equals("HIGH")) { %>
                  <span class="badge bg-danger ml-2" style="vertical-align: top">
                    <%= projectInfo.priority %>
                  </span>
                  <% } if(projectInfo.priority.equals("MEDIUM")) { %>
                    <span class="badge bg-sky ml-2" style="vertical-align: top">
                      <%= projectInfo.priority %>
                    </span>
                    <% } if(projectInfo.priority.equals("LOW")) { %>
                      <span class="badge bg-purple ml-2" style="vertical-align: top">
                        <%= projectInfo.priority %>
                      </span>
                      <% } %>
              </p>
              <form action="taskForm" method="post">
                <input type="text" name="projectId" value="<%= projectId %>" hidden />
                <button type="submit" class="btn btn-success">
                  Add Task <i class="fas fa-plus"></i>
                </button>
              </form>

            </div>
            <p class="text-muted pb-2"><i class="fas fa-paper-plane text-info"></i> &nbsp;Finish at: <%=
                projectInfo.finishTime %>
            </p>
            <hr>
            <p><i class="fas fa-sun text-warning"></i> &nbsp;Status: &nbsp;
              <% if(projectInfo.status.equals("INPROGRESS")) { %>
                <span class="badge bg-warning ml-2">
                  <%= projectInfo.status %>
                </span>
                <% } if(projectInfo.status.equals("STOPPED")) { %>
                  <span class="badge bg-lightred ml-2">
                    <%= projectInfo.status %>
                  </span>
                  <% } if(projectInfo.status.equals("COMPLETED")) { %>
                    <span class="badge bg-success ml-2">
                      <%= projectInfo.status %>
                    </span>
                    <% } %>
            </p>

            <p><i class="fas fa-keyboard text-primary"></i> &nbsp;Description
            <div class="text-muted">
              <%= projectInfo.description %>
            </div>
            </p>
          </div>
        </div>

        <main class="container-todo d-flex justify-content-center">
          <div class="col-md-8">
            <div class="card-hover-shadow-2x mb-3 card">
              <div class="card-header-tab card-header d-flex align-items-center justify-content-between">
                <div class="card-header-title font-size-lg text-capitalize font-weight-normal">
                  <i class="fa fa-tasks"></i>&nbsp;Task Lists
                </div>
                <form action="addTask" method="post" class="d-flex">
                  <input type="text" name="projectId" value="<%= projectId %>" hidden />
                  <div class="form-outline">
                    <textarea type="text" name="taskName" required style="height: 1.2em; width: 40vw" id="form2"
                      class="form-control" placeholder="Quick task..."></textarea>
                  </div>
                  <button class="btn btn-danger ms-2 btn-sm" type="submit">Quick Add</button>
                </form>
              </div>
              <div class="scroll-area-sm">
                <perfect-scrollbar class="ps-show-limits">
                  <div style="position: static" class="ps ps--active-y">
                    <div class="ps-content">
                      <ul class="list-group list-group-flush">
                        <% for(TaskInfo element : arr) { %>
                          <li class="list-group-item">
                            <div class="todo-indicator bg-warning"></div>
                            <div class="widget-content p-0">
                              <div class="widget-content-wrapper">
                                <div class="widget-content-left mr-2">
                                  <div class="custom-checkbox custom-control">
                                    <input class="custom-control-input" id="<%= element.taskId %>"
                                      type="checkbox" /><label class="custom-control-label"
                                      for="<%= element.taskId %>">&nbsp;</label>
                                  </div>
                                </div>
                                <div class="widget-content-left">
                                  <div class="widget-heading">
                                    <%= element.taskName %>

                                      <% if(element.status.equals("INPROGRESS")) { %>
                                        <span class="badge bg-purple ml-2" style="vertical-align: top">
                                          <%= element.status %>
                                        </span>
                                        <% } if(element.status.equals("STOPPED")) { %>
                                          <span class="badge bg-lightred ml-2" style="vertical-align: top">
                                            <%= element.status %>
                                          </span>
                                          <% } if(element.status.equals("COMPLETED")) { %>
                                            <span class="badge bg-success ml-2" style="vertical-align: top">
                                              <%= element.status %>
                                            </span>
                                            <% } %>

                                  </div>
                                  <div class="widget-subheading"><i>
                                      Finish at: <%= element.finishTime %>
                                    </i></div>
                                </div>
                                <form id="formSelectTask<%= element.taskId %>" action="selectTask" method="post" hidden>
                                    <input type="text" value="<%= element.taskId %>" name="taskId" />
                                    <input type="text" name="projectId" value="<%= projectId %>" />
                                    <button type="submit"></button>
                                  </form>

                                  <form id="formDeleteTask<%= element.taskId %>" action="deleteTask" method="post" hidden>
                                    <input type="text" value="<%= element.taskId %>" name="taskId" />
                                    <input type="text" name="projectId" value="<%= projectId %>" />
                                    <button type="submit"></button>
                                  </form>
                                <div class="widget-content-right">
                                  <button type="submit" onclick="document.getElementById('formSelectTask<%= element.taskId %>').submit();"
                                    class="border-0 btn-transition btn btn-outline-success">
                                    <i class="fa fa-check"></i>
                                  </button>
                                  <button type="submit" onclick="document.getElementById('formDeleteTask<%= element.taskId %>').submit();"
                                    class="border-0 btn-transition btn btn-outline-danger">
                                    <i class="fa fa-trash"></i>
                                  </button>

                                </div>
                              </div>
                            </div>
                          </li>
                          <% } %>
                      </ul>
                    </div>
                  </div>
                </perfect-scrollbar>
              </div>
              <div class="d-block p-2 text-right card-footer">
                <a href="showProject" class="mr-2 btn btn-primary btn-sm">Cancel</a>
              </div>
            </div>
          </div>
        </main>

        <div class="container-todo d-flex justify-content-center py-5">
          <div class="col-md-8">
            <div class="d-flex align-items-center justify-content-between">
              <form action="selectProject" method="post">
                <input type="text" name="projectId" value="<%= projectId %>" hidden />
                <button type="submit" class="btn bg-sky text-white">
                  EDIT PROJECT
                </button>
              </form>

              <form action="deleteProject" method="post">
                <input type="text" name="projectId" value="<%= projectId %>" hidden />
                <button type="submit" class="btn bg-orange text-white" onclick="confirmDelete(event)">
                  DELETE PROJECT
                </button>
              </form>

            </div>
          </div>
        </div>


        <jsp:include page="components/footer.jsp" />
      </body>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
      <script>
        function confirmDelete(event) {
          // Hiển thị hộp thoại xác nhận
          var confirmation = confirm("Are you sure want to delete this project?");

          if (!confirmation) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của form
          }
        }
      </script>

      </html>