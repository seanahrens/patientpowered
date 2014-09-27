
$(document).ready(function(){


  var citynames = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      url: '/conditions.json',
      filter: function(list) {
        return $.map(list, function(cityname) {
          return { name: cityname }; });
      }
    }
  });
  citynames.initialize();

  $('#tagsinput').tagsinput({
    tagClass: "label label-success",
    typeaheadjs: {
      autoselect: true,
      name: 'citynames',
      displayKey: 'name',
      valueKey: 'name',
      source: citynames.ttAdapter()
    },
    freeInput: false
  });


  $('.form-with-tagsinput').bind("keyup keypress", function(e) {
    var code = e.keyCode || e.which;
    if (code  == 13) {
      e.preventDefault();
      return false;
    }
  });

});