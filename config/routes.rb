Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'file_uploads#index', as: 'index'
  post 'upload_file', to: 'file_uploads#file_content', as: 'upload_file'
end
