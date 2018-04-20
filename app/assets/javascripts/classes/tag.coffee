# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class window.Tag
  @id: 0
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
    

  refresh: (target, tags) ->
    target.empty
    for tag in tags
      target.append tag.create_tag

  create_candidate_tag: () ->
    return "<div class='note_tag candidate_#{@status}'>#{@name}</div>"

  create_selected_tag: () ->
    return "<div class='note_tag'>#{@name}</div>"
