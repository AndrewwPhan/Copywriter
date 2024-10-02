class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      enhanced_content = OpenaiService.new.generate_enhanced_content(@note.content)
      @note.update(enhanced_content: enhanced_content)
      redirect_to notes_path, notice: 'Note successfully created!'
    else
      render :new
    end
  end

  def index
    @notes = current_user.notes
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
