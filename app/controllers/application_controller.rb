class ApplicationController < ActionController::Base

  # [GET] /
  # Default URL for this project
  def index
    @therapist = Therapist.first
    @client = Client.first
  end

end
