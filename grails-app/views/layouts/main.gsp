<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Webbook</title>
    <!-- <link href='http://fonts.googleapis.com/css?family=Patua+One' rel='stylesheet' type='text/css'> -->
    <!-- <link href='http://fonts.googleapis.com/css?family=Lato|Metrophobic' rel='stylesheet' type='text/css'> -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'text.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: '960.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">

  <g:layoutHead/>
  <r:layoutResources />

</head>

<body>
  <!-- Cabeçalho -->
  <header>
    <nav class="container_16">
      <a class="logo wb-left-float" href="/webbook">Webbook</a>
      <form id="searchbox" class="wb-left-float" action="">
        <input id="search" class="wb-left-float" type="text">
        <input id="submit" type="submit" class="wb-left-float" value="Pesquisar">
      </form>
      <ul class="wb-right-float">
        <li><a href="#" id="button-login" class="wb-border-radius-all">Entrar</a></li>
        <li><a href="/webbook/user/create" id="button-sign" class="wb-border-radius-all">Cadastre-se</a></li>
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
      <li><a href="#">Sobre</a></li>

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

