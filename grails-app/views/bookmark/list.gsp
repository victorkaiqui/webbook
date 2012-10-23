
<%@ page import="br.com.webbook.Bookmark" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  </head>
  <body>

    <table>
      <thead>
        <tr>

      <g:sortableColumn property="dateCreated" title="${message(code: 'bookmark.dateCreated.label', default: 'Date Created')}" />

      <g:sortableColumn property="description" title="${message(code: 'bookmark.description.label', default: 'Description')}" />   

      <g:sortableColumn property="title" title="${message(code: 'bookmark.title.label', default: 'Title')}" />

      <g:sortableColumn property="url" title="${message(code: 'bookmark.url.label', default: 'Url')}" />


    </tr>
  </thead>
  <tbody>
  <g:each in="${bookmarkInstanceList}" status="i" var="bookmarkInstance">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

      <td>${fieldValue(bean: bookmarkInstance, field: "dateCreated")}</td>    

      <td>${fieldValue(bean: bookmarkInstance, field: "title")}</td>

      <td>${fieldValue(bean: bookmarkInstance, field: "description")}</td>  

      <td>${fieldValue(bean: bookmarkInstance, field: "url")}</td>

      <td>${bookmarkInstanceTotal}</td>

    </tr>
  </g:each>
</tbody>
</table>
<div class="pagination">
  <g:paginate total="${bookmarkInstanceTotal}" />
</div>

</body>
</html>
