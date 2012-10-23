<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
  <facebookAuth:init />
  <title> Webbook - <sec:loggedInUserInfo field="username"/></title>
</head>
<body>

<sec:ifLoggedIn>

  <g:render template="/loginTrue"/>

</sec:ifLoggedIn>

<sec:ifNotLoggedIn>

  <g:render template="/loginFalse"/>

</sec:ifNotLoggedIn>

</body>
</html>
