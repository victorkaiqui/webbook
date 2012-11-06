<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Sample title</title>
  </head>
  <body>
  
  <g:each in="${users}" var="user">
    ${user.username}
  </g:each>
  
  <g:each in="${bookmarks}" var="bookmark">
    ${bookmark.url}<br>
  </g:each>
  
    
  </body>
</html>
