<div class="container-fluid">
  <div class="row-fluid">
    <div class="span3">

      <title> Webbook - <sec:loggedInUserInfo field="username"/></title>

      <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-circle" size="42" defaultGravatarUrl="mm"/>
      <span class="help-inline">
        <h4><sec:loggedInUserInfo field="username"/></h4>
      </span>

${bookmarkInstanceTotal}
${user.followings.size()}
${user.followers.size()}

      <div class="container">  
        <div id="bookmark" class="modal hide fade in" style="display: none; ">  
          <div class="modal-header">  
            <a class="close" data-dismiss="modal">×</a>  
            <h3>Adicione seu novo favorito</h3>  
          </div>  

          <div class="modal-body">  

            <g:form url="[action:'save', controller:'bookmark']">
              <fieldset>

                <g:render template="/bookmark/form" />

                <div class="modal-footer">                  
                  <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
                  <a href="#" class="btn btn-large" data-dismiss="modal">Close</a>  
                </div>

              </fieldset>
            </g:form>

          </div>  
        </div>

        <p><a data-toggle="modal" href="#bookmark" class="btn btn-primary"><i class="icon-plus icon-white"></i> Favorito</a></p>  

      </div>
    </div>

    <div class="span9">
      <h1>Novidades:</h1>
      <hr> 

      <g:each in="${timelineList}" status="i" var="bookmarkInstance">

        <div class="bookmark">
          <p><a href="">${bookmarkInstance.user.username}</a> <small><g:formatDate format="dd/MM/yyyy HH:mm" date="${bookmarkInstance.dateCreated}"/></small></p>            
          <h6>${fieldValue(bean: bookmarkInstance, field: "title")}</h6>
          <p><small>${fieldValue(bean: bookmarkInstance, field: "url")}</small></p>
          <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>
          <ul class="acoes" style="display: none">
            <li><i class="icon-edit"></i>Ação1</li>
            <li>Ação2</li>
          </ul>
        </div>
        <hr>

      </g:each>

    </div>
  </div>
</div>
</div>

<script>
  $(document).ready(function(){
        $("div.bookmark").hover(
                function(){
                        $(this).find("ul.acoes").show();
                },
                function(){
                  $(this).find("ul.acoes").hide();
                }
          );
          $("#tags").tagsInput({
            'defaultText':'Adicione tags',
            'height':'100px',
            'width':'215px'
          });
})


</script>