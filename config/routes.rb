Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/progress_notes/:therapist_id/:client_id/notes/', to: "notes#index", as: :notes
  get '/progress_notes/:therapist_id/:client_id/notes/:id/edit', to: "notes#edit", as: :edit_note

  # Default index route
  root 'application#index'

end
