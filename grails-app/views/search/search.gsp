<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Sample title</title>
  </head>
  <body>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span6">
          <g:each in="${users}" var="user">
${user.username}<br>
          </g:each>
        </div>
        <div class="span6">
          <g:each in="${bookmarks}" var="bookmark">
${bookmark.url}<br>
          </g:each>
        </div>
      </div>
    </div>






  </body>
</html>
