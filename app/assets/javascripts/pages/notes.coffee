# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
onPageLoad ['notes#new', 'notes#edit'], ->
  Tag.area_refresh($('#tag_candidate_area'))
  Tag.area_refresh($('#tag_selected_area'))

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
        Tag.area_refresh($candidate_area)
      else
        $candidate_area.find('.note_tag').remove()

        Tag.area_refresh($candidate_area)
    search_ajax(tag_name, success_func)

  $("#add_tag_button").on 'click', (e) ->
    tag_name = $('#tags_text').val()
    if tag_name
      tag = new Tag(tag_name)
      Tag.select_tag(tag)
      $('#tags_text').val('')
      $('#tag_candidate_area .note_tag').remove()
      Tag.area_refresh($("#tag_candidate_area"))
      Tag.area_refresh($("#tag_selected_area"))

  $(".tag_wrapper .delete-icon").on 'click', (e) ->
    Tag.delete_tag($(e.target))


search_ajax = (tag_name, success_func, error_func) ->
  url = "http://localhost:3000/api/tag/search"
  request_data = {
    "tag_name" : tag_name
  }

  ajax_core(url, request_data, success_func, error_func)
