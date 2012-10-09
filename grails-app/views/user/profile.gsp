<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>${user.username}</title>
  </head>
  <body>

    <div class="row-fluid">
      <div span="4" style="background: black">

        <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="128"/>

      </div>
      <div span="8" style="background: black">
        <h1 class="fullname">${user.username}</h1>
      </div>
    </div>

  </body>
</html>
