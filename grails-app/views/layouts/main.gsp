<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title> <g:message code="my.text.welcomeTitle"/></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">  
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

  <g:layoutHead />
  <r:layoutResources />
</head>

<body>

  <!-- Cabeçalho -->

  <header>
    <div class="navbar">
      <div class="navbar-inner">
        <a class="brand" href="${request.contextPath}"><g:message code="my.text.title"/></a>

        <sec:ifLoggedIn>

          <form class="navbar-search pull-center">
            <input type="text" class="search-query" placeholder="Search">
          </form>

          <div class="btn-group pull-right">
            <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user icon-white"></i><span class="caret"></span></a>

            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdown">
              <li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
              <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
              <li><a href="#"><i class="icon-ban-circle"></i> Ban</a></li>
              <li class="divider"></li>
              <li><a href="#"><i class="i"></i> Make admin</a></li>
            </ul>
          </div>

        </sec:ifLoggedIn>

      </div>
    </div>
  </header>

  <!-- Conteúdo-->
  <div class="container">

    <g:layoutBody />

  </div>

  <!--Rodapé-->
  <footer>
    <ul class="nav nav-pills">
      <li><a href="footer/sobre"><g:message code="my.text.footer.sobre"/></a></li>

      <li><a href="footer/ferramentas"><g:message code="my.text.footer.ferramentas"/></a></li>

      <li><a href="footer/blog"><g:message code="my.text.footer.blog"/></a></li>

      <li><a href="footer/ajuda"><g:message code="my.text.footer.ajuda"/></a></li>

      <li><a href="footer/desenvolvedores"><g:message code="my.text.footer.desenvolvedores"/></a></li>

      <li><a href="footer/feeds"><g:message code="my.text.footer.feeds"/></a></li>

      <li><a href="footer/termosdeuso"><g:message code="my.text.footer.termosDeUso"/></a></li>

      <li><a href="footer/politicadeprivacidade"><g:message code="my.text.footer.politicaDePrivacidade"/></a></li>

    </ul>
  </footer>

</body>

</html>

