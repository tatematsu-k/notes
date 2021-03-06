class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @all_tags = Tag.all_load_by_user(current_user)
    @all_notes = Note.all_load_by_user(current_user)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    @note.user = current_user
    if params[:tag_id]
      tag = Tag.find(params[:tag_id])
      @note.tags << tag
    end
    menu_active_reset
    @menu_items[:new_note][:active] = true
    @form_button = '登録'
  end

  # GET /notes/1/edit
  def edit
  @form_button = '更新'
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @tags = tag_list_from_param
    @note.user = current_user

    respond_to do |format|
      if @note.save && (@tags.empty? || Tag.update_note_tags(current_user, @note.id, @tags))
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @tags = tag_list_from_param
    respond_to do |format|
      if @note.update(note_params) && (@tags.empty? || Tag.update_note_tags(current_user, @note.id, @tags))
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    TagMemo.delete_by_note_id(@note.id)
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :content, :user_id)
    end

    def tag_list_from_param
      tags = []
      if params[:tag]
        params.require(:tag).each do |tag|
          tags << Tag.new(tag.permit(:id, :name))
        end
      end
      tags
    end
end
