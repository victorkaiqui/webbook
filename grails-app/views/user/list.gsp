
<%@ page import="br.com.webbook.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


  <div class="row-fluid">
    <div class="span12">
      <sec:loggedInUserInfo field="username" />
      <div class="row-fluid">
        <div class="span2">
          <div class="module">
            <ul class="nav nav-pills nav-stacked">
              <li class="active"><g:link controller="user" action="editProfile" class="list-link js-nav" data-nav="account"> Conta <i class="chev-right"></i></g:link></li>
              <li class=""><a class="list-link js-nav" href="/settings/password" data-nav="password">Senha<i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/devices" data-nav="devices">Celular <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/notifications" data-nav="notifications">Notificações por e-mail <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="/settings/profile" data-nav="profile">Perfil <i class="chev-right"></i></a></li>
            </ul>
          </div>
        </div>
        <div class="span10">

          <div id="list-user" class="content scaffold-list" role="main">

            <g:if test="${flash.message}">
              <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
              <thead>
                <tr>

              <g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Username')}" />

              <g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Name')}" />

              <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Last Name')}" />

              <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />

              <g:sortableColumn property="birthyday" title="${message(code: 'user.birthyday.label', default: 'Birthyday')}" />

              </tr>
              </thead>
              <tbody>

                <tr>

                  <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

              <td>${fieldValue(bean: userInstance, field: "name")}</td>

              <td>${fieldValue(bean: userInstance, field: "lastName")}</td>					


              <td>${fieldValue(bean: userInstance, field: "email")}</td>

              <td><g:formatDate date="${userInstance.birthyday}" /></td>

              </tr>

              </tbody>
            </table>


          </div>
        </div>
      </div>
    </div>









  </div>
</body>
</html>
