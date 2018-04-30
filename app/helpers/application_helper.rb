module ApplicationHelper
  def basic_card(options = {}, &block)
    options = {
      class: 'card',
      style: 'max-width: 20rem;'
    }.merge(options)
    content_tag(:div, capture(&block), options)
  end

  def card_header(&block)
    content_tag(:div, capture(&block), class: 'card-header')
  end

  def card_body(&block)
    content_tag(:div, class: 'card-body') do
      concat content_tag(:p, capture(&block), class: 'card-text')
    end
  end
end
