Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:index, :create, :update] do
        resources :messages, only: [:index, :create]
      end

      get 'reports/tickets_count', to: 'reports#tickets_count'
      get 'reports/tickets.csv', to: 'reports#export_csv'
    end
  end
end