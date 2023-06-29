<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.*,java.io.*" %>
    <%! public ArrayList<Integer> getDays(int year, int month) {
      ArrayList<Integer> days = new ArrayList<Integer>();
          Calendar calendar = Calendar.getInstance();
          calendar.set(year, month - 1, 1);
          int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
          int startDay = calendar.get(Calendar.DAY_OF_WEEK);
          for (int i = 1; i < startDay; i++) { days.add(0); } for (int i=1; i <=maxDay; i++) { days.add(i); } return
            days; } %>
            <!DOCTYPE html>
            <html>

            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

              <title>Calendar</title>

              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css" />
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
              
              <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
                integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
                crossorigin="anonymous" />

              <link rel="stylesheet" type="text/css" href="./css/style.css" />
            </head>

            <body class="bg-gray-200">
              <header>
                <%@ include file="components/header.jsp" %>
              </header>

              <% String monthString=(String) request.getAttribute("monthString"); int year=(int)
                request.getAttribute("year"); int month=(int) request.getAttribute("month"); ArrayList<Integer> days =
                getDays(year, month); %>
                <div class="container mx-auto mt-10 mb-4">
                  <div class="wrapper bg-white rounded shadow">
                    <div class="header flex justify-between border-b p-2">
                      <span class="text-lg font-bold">
                        <%= monthString %>
                          <%= year %>
                      </span>
                      <div class="buttons flex flex-row">
                        <form class="flex" action="getCalendar" method="post">
                          <input type="text" hidden value="<%= month  %>" name="month" />
                          <input type="text" hidden value="<%= year  %>" name="year" />
                          <input type="text" hidden value="prev" name="option" />
                          <button class="p-1 cursor-pointer" type="submit">
                            <svg width="1.5em" fill="black" height="1.5em" viewBox="0 0 16 16"
                              class="bi bi-arrow-left-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                              <path fill-rule="evenodd"
                                d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                              <path fill-rule="evenodd"
                                d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z" />
                              <path fill-rule="evenodd"
                                d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z" />
                            </svg>
                          </button>
                        </form>
                        <form class="flex" action="getCalendar" method="post">
                          <input type="text" hidden value="<%= month  %>" name="month" />
                          <input type="text" hidden value="<%= year  %>" name="year" />
                          <input type="text" hidden value="next" name="option" />
                          <button class="p-1 cursor-pointer" type="submit">
                            <svg width="1.5em" fill="black" height="1.5em" viewBox="0 0 16 16"
                              class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                              <path fill-rule="evenodd"
                                d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                              <path fill-rule="evenodd"
                                d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z" />
                              <path fill-rule="evenodd"
                                d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
                            </svg>
                          </button>
                        </form>
                      </div>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-bordered text-center">
                        <thead>
                          <tr>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Sunday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Sun</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Monday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Mon</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Tuesday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Tue</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Wednesday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Wed</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Thursday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Thu</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Friday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Fri</span>
                            </th>
                            <th class="p-2 border-r h-10 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 xl:text-sm text-xs">
                              <span class="xl:block lg:block md:block sm:block hidden">Saturday</span>
                              <span class="xl:hidden lg:hidden md:hidden sm:hidden block">Sat</span>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="text-center h-20">
                            <% int count=0; for (int i=0; i < days.size(); i++) { int day=days.get(i); count++; if
                              (day==0) { %>
                              <td
                                class="border p-1 h-40 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 overflow-auto transition cursor-pointer duration-500 ease hover:bg-gray-300">
                                <div
                                  class="flex flex-col h-40 mx-auto xl:w-40 lg:w-30 md:w-30 sm:w-full w-10 mx-auto overflow-hidden">
                                  <div class="top h-5 w-full">
                                    <span class="text-gray-500"></span>
                                  </div>
                                  <!-- <div class="bottom flex-grow h-30 py-1 w-full cursor-pointer">
                                    <div class="event bg-purple-400 text-white rounded p-1 text-sm mb-1">
                                      <span class="event-name"> Meating </span>
                                      <span class="time"> 12:00~14:00 </span>
                                    </div>
                                    <div class="event bg-purple-400 text-white rounded p-1 text-sm mb-1">
                                      <span class="event-name"> Meating </span>
                                      <span class="time"> 18:00-20:00 </span>
                                    </div>
                                  </div> -->
                                </div>
                              </td>
                              <% } else { %>
                                <td
                                  class="border p-1 h-40 xl:w-40 lg:w-30 md:w-30 sm:w-20 w-10 overflow-hidden transition cursor-pointer duration-500 ease hover:bg-gray-300">
                                  <div
                                    class="flex flex-col h-40 mx-auto xl:w-40 lg:w-30 md:w-30 sm:w-full w-10 mx-auto overflow-hidden">
                                    <div class="top h-5 w-full">
                                      <span class="text-gray-500">
                                        <%= day %>
                                      </span>
                                    </div>
                                    <!-- <div class="bottom flex-grow h-30 py-1 w-full cursor-pointer">
                                      <div class="event bg-blue-400 text-white rounded p-1 text-sm mb-1">
                                        <span class="event-name"> Shopping </span>
                                        <span class="time"> 12:00-14:00 </span>
                                      </div>
                                    </div> -->
                                  </div>
                                </td>
                                <% } if (count % 7==0) { %>
                          </tr>
                          <tr class="text-center h-20">
                            <% } } %>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

                <jsp:include page="components/footer.jsp" />

            </body>

            </html>