Rails.application.routes.draw do
  root to: 'application#redirect_to_courses'

  resources :courses, only: :index
end
