class Api::TagController < ApplicationController
  def search
    tag_name = params[:tag_name]
    tag = Tag.search_candidate(current_user, tag_name)
    render json: tag
  end
end
