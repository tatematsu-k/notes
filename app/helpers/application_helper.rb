module ApplicationHelper
  def basic_card(options = {}, &block)
    options = {
      class: ['card', 'note_card']
    }.merge(options)
    content_tag(:div, capture(&block), options)
  end

  def card_header(data, &block)
    content_tag(:div, class: 'card-header') do
      concat(
        if data.is_a?(Note)
          content_tag(:div, class: 'card-button-group') do
            concat link_to '編集',
              edit_note_path(data),
              class: ['btn', 'card-button', 'note-edit-button']
            concat link_to '削除', data,
              class: ['btn', 'card-button', 'note-delete-button'],
              method: :delete,
              data: { confirm: 'Are you sure?' }
          end
        end
      )
      concat(
        content_tag(:div, class: 'wrapper') do
          content_tag(:div, capture(&block), class: 'header-text')
        end
      )
    end
  end

  def card_body(&block)
    content_tag(:div, class: 'card-body') do
      concat content_tag(:div, capture(&block), class: 'card-text')
    end
  end
end
