<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title> <g:message code="my.text.welcomeTitle"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'text.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: '960.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">


  <g:layoutHead/>
  <r:layoutResources />
<!--  <facebookAuth:init />-->

</head>

<body>

  <!-- Cabeçalho -->

  <header style=" padding: 10px">
    <nav class="container_16">
      <a class="logo wb-left-float" href="/webbook">Webbook</a>
      <form id="searchbox" class="wb-left-float" action="">
        <input id="search" class="wb-left-float" type="text">
        <input id="submit" type="submit" class="wb-left-float" value="Pesquisar">
      </form>
      <ul class="wb-right-float">
        <sec:ifLoggedIn>
          <a href="/webbook/user/edit/"><sec:username id='wb-left-float' /></a>(<g:link controller="logout" >sign out</g:link>)
        </sec:ifLoggedIn>

        <sec:ifNotLoggedIn>

          <li><a href="/webbook/login/auth" id="button-sign" class="wb-border-radius-all">Entrar</a></li>
<!--          <li ><facebookAuth:connect permissions="email,user_auserbout_me"/></li>-->

        </sec:ifNotLoggedIn>

      </ul>
    </nav>
  </header>

  <!-- Conteúdo-->
  <section id="content" class="container_12">

    <g:layoutBody/>

  </section>
  <!--Rodapé-->
  <footer>
    <ul>
      <li><a href="/webbook/error">Sobre</a></li>

      <li><a href="#">Ferramentas</a></li>

      <li><a href="#" target="_blank">Blog</a></li>

      <li><a href="#">Ajuda</a></li>

      <li><a href="#">Desenvolvedores</a></li>

      <li><a href="#">Feeds</a></li>

      <li><a href="#">Termos de uso</a></li>

      <li><a href="#">Política de privacidade</a></li>

    </ul>
  </footer>

</body>

</html>

