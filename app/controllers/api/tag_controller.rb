class Api::TagController < ApplicationController
  def search
    tag_name = params[:tag_name]
    tag = []
    tag = Tag.search_candidate(current_user, tag_name) if tag_name && tag_name.length > 0
    render json: tag
  end
end
