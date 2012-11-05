<div class="container-fluid">
  <div class="row-fluid">

    <div class="span3">

      <div class="thumbnail"  style="background: gainsboro">
        <title> Webbook · <sec:loggedInUserInfo field="username"/></title>

        <div class="row-fluid" style="text-align: center">
          <a href="${request.contextPath}/${user.username}">
            <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-circle" size="32" defaultGravatarUrl="mm" />
            <h4>${user.username}</h4>
          </a>
        </div>
        <hr>

        <div class="row-fluid">
          <div class="thumbnail span4">${bookmarkInstanceTotal} 
            <div><small>favoritos</small></div>
          </div>

          <div class="thumbnail span4">${user.followings.size()} 
            <div><small>seguindo</small></div>
          </div>

          <div class="thumbnail span4">${user.followers.size()} 
            <div><small>seguidores</small></div>
          </div>
        </div>

        <hr>

        <div class="row-fluid">

          <div class="input-append">

            <g:textField id="bookmarkUrl" name="campo" required=" "class="input-medium"   placeholder=" + Favorito" /> 
            <a id="openBookmarkModal" data-toggle="modal" href="#bookmark" class="btn btn-warning btn-primary"><i class="icon-plus icon-white"></i></a>

          </div>            

        </div>
      </div>

      <div id="bookmarkModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
                <a href="#" class="btn btn-large" data-dismiss="modal" >Close</a>  
              </div>

            </fieldset>
          </g:form>

        </div>  
      </div>

      <br>
      <div class="thumbnail">
        <ul class="unstyled">
<!--          <g:each in="${tags}" status="i" var="tag">
            <li>${tag}</li>
          </g:each>-->
          <g:each in="${tags}">
            <li> <span class="label">#${it}</span></li>
          </g:each>
        </ul>
      </div>
    </div>
    <!------------------------------------------------------------------------>
    <div class="thumbnail span8">
      <h4>Favoritos:</h4>
      <hr> 

      <g:each in="${timelineList}" status="i" var="bookmarkInstance">

        <div class="favorito">

          <div class="row-fluid">

            <div class="span1">
              <avatar:gravatar email="${bookmarkInstance.user.email}" alt="${bookmarkInstance.user.username}"  cssClass="img-rounded" size="42" defaultGravatarUrl="mm" />
            </div>

            <div class="span11" id="dispose">


              <a href="${request.contextPath}/${bookmarkInstance.user.username}">
                <h5 style="margin-top: 0">${bookmarkInstance.user.username}</h5>
              </a>

<!--              <a href="${request.contextPath}/bookmark/update?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark">
                <h6 style="margin-bottom: 0">${fieldValue(bean: bookmarkInstance, field: "title")}</h6>
              </a>-->


              <small style="margin-top: 0"><a href="${fieldValue(bean: bookmarkInstance, field: "urlShorten")}">${fieldValue(bean: bookmarkInstance, field: "urlShorten")}</a></small>        
              <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

              <div class="row-fluid">
                <g:each in="${bookmarkInstance.tags}">
                  <span class="label label-info">#${it}</span>
                </g:each>
              </div>

            </div>            
          </div>  

          <div class="row-fluid">
            <div class="span8">
              <g:form controller="bookmark">

                <i class="icon-edit"></i><g:actionSubmit action="delete" value="Comentar" class="btn btn-link"  onclick="return confirm('Você tem certeza?');" />

              </g:form>
            </div>

            <div class="acoes" style="display: none;">

              <g:if test="${user.username != bookmarkInstance.user.username}">
                <div class="span2">                

                  <i class="icon-ok"></i><a href="${request.contextPath}/bookmark/favoritar?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark">Favoritar</a>

                </div>
              </g:if>

              <div class="span2">
                <g:if test="${user.id == bookmarkInstance.user.id}">   

                  <g:form controller="bookmark">

                    <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                    <i class="icon-trash"></i><g:actionSubmit action="delete" value="Excluir" class="btn btn-link"  onclick="return confirm('Você tem certeza?');" />

                  </g:form>

                </g:if>
              </div>
            </div> 
          </div> 

          <div class="comment" style="display: none;">
            <g:form url="[action:'save', controller:'comment']">
              <g:render template="/comment/form"/>
              <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
              <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </g:form>
          </div>

        </div>

        <hr>
      </g:each>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){
  $("div.favorito").hover(
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
    'width':'215px',
    'placeholderColor' :'#B8B8B8'
  });

  $('#openBookmarkModal').click(function() {
    var url =  $("#bookmarkUrl").val();

    $.getJSON('${request.contextPath}/bookmark/preview', {url: url} , function(data){
      $("#url").val(data.url);      
    }); 

    $('#bookmarkModal').modal();

  });
  
  function loadData(){
    var url = $(this).attr("href");
    $.get(url, {}, function (data){
$("#id").val(data.id);
$("#title").val(data.title);
$("#url").val(data.url);
$("#description").val(data.description);
$("#tags").val(data.tags);
$("#tags").importTags(data.tags.toString());

$('#bookmarkModal').modal();
});
}

$('.openBookmark').on('click', loadData);

})
</script>