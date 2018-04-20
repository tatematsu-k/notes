@ajax_core = (url, data, success_func, error_func, type = 'get'
              , data_type = 'json') ->
  $.ajax
    async:     true
    type:      type
    url:       url
    dataType:  data_type
    data:       data
    success:   success_func
    error:     error_func
