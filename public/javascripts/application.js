// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link,content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("Adicionar Item", "g")  
  $(link).up().insert({before: content.replace(regexp, new_id)});
  //$(link).hide();
}