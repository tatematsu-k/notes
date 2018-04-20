# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
onPageLoad ['notes#new', 'notes#edit'], ->
  area_refresh($('#tag_candidate_area'))
  area_refresh($('#tag_selected_area'))

  # add event todo
  $("#tags_text").on 'keyup', (e) ->
    tag_name = $("#tags_text").val()
    success_func = (datas) ->
      $candidate_area = $('#tag_candidate_area')
      if datas
        $candidate_area.find('.note_tag').remove()
        datas.forEach((data) ->
          tag = window.Tag.create_by_data(data)
          $candidate_area.append(tag.create_candidate_tag())
          )
        area_refresh($candidate_area)
      else
        $candidate_area.find('.note_tag').remove()
        area_refresh($candidate_area)
    search_ajax(tag_name, success_func)


search_ajax = (tag_name, success_func, error_func) ->
  url = "http://localhost:3000/api/tag/search"
  request_data = {
    "tag_name" : tag_name
  }

  ajax_core(url, request_data, success_func, error_func)

area_refresh = ($area) ->
  if $area.find('.note_tag').length
    $area.show()
  else
    $area.hide()
