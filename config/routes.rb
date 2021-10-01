Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :records do
    get :download_csv_by_nationality, on: :collection
    get :download_csv_by_odometer, on: :collection
  end

  root 'records#new'
end
