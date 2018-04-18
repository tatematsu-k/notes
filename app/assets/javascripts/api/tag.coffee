# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Tag
  id
  name
  status # new or exist

  constractor: (name) ->
    name = name
    status = 'new'

  @create_by_data: (data) ->
    tag = new Tag(data.name)
    tag.id = data.id
    tag.status = 'exist'

  create_tag: () ->
    return "<div class='note_tag'>#{name}</div>"
