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

  def format_date(date_time)
    now = Time.now
    diff = (now - date_time).floor
    case diff
    when 0...(60 * 60)
      (diff / 60).to_s + ' minutes ago'
    when (60 * 60)...(60 * 60 * 24)
      (diff / 60 / 60).to_s + ' hours ago'
    else
      date_time.strftime('%Y/%m/%d')
    end
  end
end
