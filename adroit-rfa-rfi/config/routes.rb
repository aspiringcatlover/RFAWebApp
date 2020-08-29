Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :rfas do
    member do
        delete :delete_attachment
        put :reject_rfa
        delete :remove_old_revisions
    end
end
resources :projects

#get "rfas/edit" => 'rfas#edit_modal', as: :edit_modal_rfa

get '/dashboard' => 'rfas#dashboard'
get '/project_dashboard' => 'rfas#project_dashboard'

root 'rfas#index'
end

