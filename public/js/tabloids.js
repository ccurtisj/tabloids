var Tabloids = {
  posts : {
    edit : {
      init : function(availableTags){
        $('#post_tag_list').tagit({
          singleField: true,
          fieldName : 'post_tag_list',
          availableTags : availableTags
        });
        
        $('#post_content').wysiwyg();
      }
    }
  }
}