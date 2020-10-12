class NotesController < ActionController::Base

  layout 'application'

  before_action :set_objects

  # [GET] /
  # Default URL for notes
  def index
    @note = ProgressNote.new
  end

  # [GET] /edit
  def edit
    @note = @client.progress_notes.find_or_initialize_by id: params[:id]
  end

  private

  #  Set our objects or redirect
  def set_objects
    @therapist = Therapist.find_or_initialize_by id: params[:therapist_id]
    @client = @therapist.clients.find_or_initialize_by id: params[:client_id]
    @notes = @client.progress_notes

    redirect_to :root, flash: {error: "Could find those objects."} and return if @therapist.new_record? || @client.new_record?
  end

end
