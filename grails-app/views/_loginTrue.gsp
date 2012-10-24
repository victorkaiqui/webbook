<div class="container-fluid">
  <div class="row-fluid">
    <div class=" thumbnail span3">

      <title> Webbook - <sec:loggedInUserInfo field="username"/></title>


      <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-circle" size="42" defaultGravatarUrl="mm"/>
      <div>
        <span class="help-inline">
          <h4><sec:loggedInUserInfo field="username"/></h4>
        </span>
      </div>


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

    <div class="thumbnail span9">
      <h4>Favoritos:</h4>
      <hr> 

      <g:each in="${timelineList}" status="i" var="bookmarkInstance">

        <div class="thumbnail span3">
          <img src="http://placehold.it/260x180" alt="Sample Image">
        </div>

        <div class="span8">
          
          <div class="acoes" style="display: none; position: relative;">      
            <g:if test="${user.id == bookmarkInstance.user.id}">   
              
              <g:form controller="bookmark">
                <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                <g:actionSubmit class="btn btn-mini btn-danger" action="delete" style="position: absolute; right: 0;" value="x" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
              </g:form>

            </g:if>
          </div>  
          
          <g:link controller="user" action="profile" id="${bookmarkInstance.id}">
            <h5>${bookmarkInstance.user.username}</h5>
<!--            <small><g:formatDate format="dd/MM/yyyy HH:mm" date="${bookmarkInstance.dateCreated}"/></small>-->
          </g:link>

         

          <g:link controller="bookmark" action="show" id="${bookmarkInstance.id}">
            <h5>${fieldValue(bean: bookmarkInstance, field: "title")}</h5>
          </g:link>

          <p><small><a href="${fieldValue(bean: bookmarkInstance, field: "url")}">${fieldValue(bean: bookmarkInstance, field: "url")}</a></small></p>          
          <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

          <!--          <ul class="acoes" style="display: none">
          
                      <a href="#" class="btn btn-mini btn-primary">Action</a>
                      <a href="#" class="btn btn-mini">Action</a>
          
                    </ul>       -->

          <hr>         
        </div>

      </g:each>

    </div>
  </div>
</div>


<script>
  $(document).ready(function(){
        $("div.span8").hover(
                function(){
                        $(this).find("div.acoes").show();
                },
                function(){
                  $(this).find("div.acoes").hide();
                }
          );
          $("#tags").tagsInput({
            'defaultText':'Adicione tags',
            'height':'100px',
            'width':'215px'
          });
})


</script>