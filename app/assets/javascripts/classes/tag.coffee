# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class window.Tag
  @id: -1
  @name: ''
  @status: 'new' # new or exist

  constructor: (name) ->
    @name = name
    @status = 'new'

  @create_by_data: (data) ->
    tag = new Tag(data.name)
    tag.id = data.id
    tag.status = 'exist'
    tag

  @select_tag: (tag) ->
    $selected_area = $('#tag_selected_area')
    $tag_html = $(tag.create_selected_tag())
    $selected_area.append($tag_html)
    $tag_html.find('.delete-icon').on 'click', (e) ->
      Tag.delete_tag($(e.target))

  @delete_tag: ($target) ->
    $area = $target.closest('.tag_area')
    $target.closest(".tag_wrapper").remove()
    Tag.area_refresh($area)

  @area_refresh = ($area) ->
    if $area.find('.note_tag').length
      $area.show()
    else
      $area.hide()

  refresh: (target, tags) ->
    target.empty
    for tag in tags
      target.append tag.create_tag

  create_candidate_tag: () ->
    return "
    <div class='tag_wrapper'>
      <div class='note_tag candidate_#{@status}'>#{@name}</div>
    </div>"

  create_selected_tag: () ->
    return "
    <div class='tag_wrapper'>
      <div class='note_tag'>
        #{@name}
        <image src='http://localhost:3000/assets/common/delete_icon.png' class='delete-icon'>
      </div>
      <input type='hidden' name='tag[][id]' value='#{@id}'>
      <input type='hidden' name='tag[][name]' value='#{@name}'>
    </div>"
