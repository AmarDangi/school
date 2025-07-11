Rails.application.routes.draw do
  root 'school_directors#index'
  get "school_directors/:id/confirm_otps", to: "email_otps#confirm_otps"
  get '/destroy_school_directors/:id', to: 'school_directors#destroy', as: 'destroy_school_directors'
  resources  :school_directors do 
    resources :schools 
  end
  resources :teachers
  get "all_schools", to: "schools#index"
   get "school_directors/:id/school/:id/teachers/new", to: "teachers#new" 
   post "school_create", to: "schools#create"
   post "school_directors/:id/schools/new", to: "schools#create"
   # get "school_director_id/schools/:id", to:  "schools#show" 
   post "/check_otp", to: "email_otps#check_otp"
 
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   # Defines the root path route ("/")
   # root "articles#index"
end