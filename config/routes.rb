Rails.application.routes.draw do

  resources :ideas
  get 'ideas/:id/follow' => 'ideas#follow', as: :follow_idea
  get 'ideas/:id/stop_following_idea' => 'ideas#stop_following', as: :stop_following_idea
  get 'tagged' => 'ideas#tagged', :as => 'tagged'
  get 'interests' => 'social#interests'
  resources :users
  match "/ideas/add_new_comment" => "ideas#add_new_comment", :as => "add_new_comment_to_ideas", :via => [:post]

  get 'test' => 'pcori#test'

  get 'conditions' => 'pcori#conditions'
  get 'by_condition' => 'users#by_condition'
  get 'following_idea' => 'users#following_idea', :as => 'following_idea'
  get 'slides' => 'pcori#slides'
  get 'stats' => 'pcori#stats'
  get 'me' => 'pcori#me'
  get 'tour' => 'pcori#tour'

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/social/discussion'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Static Pages
  root 'pcori#overview'


  get 'study_index' => 'pcori#study_index'
  get 'study_show' => 'pcori#study_show'
  get 'study_new' => 'pcori#study_new'
  get 'idea_index' => 'pcori#idea_index'
  get 'idea_show' => 'pcori#idea_show'
  get 'idea_new' => 'pcori#idea_new'
  get 'overview' => 'pcori#overview'
  get 'stats' => 'pcori#stats'


  get 'idea_' => 'pcori#idea_show'



  get 'about' => 'static#about'
  get 'external_link_warning' => 'static#external_link_warning'
  get 'privacy' => 'static#privacy'
  get 'terms' => 'static#terms'






  # Research Section
  get 'research_topics' => 'research#research_topics'
  get 'research_question' => 'research#research_question'
  get 'research_karma' => 'research#research_karma'
  get 'research_today' => 'research#research_today'
  get 'research_surveys' => 'research#research_surveys', as: :surveys
  get 'data_connections' => 'research#data_connections'
  get 'new_question' => 'research#new_question'

  # Surveys
  get 'research_surveys/report/:answer_session_id', to: 'surveys#show_report', as: :survey_report
  get 'research_surveys/:question_flow_id', to: 'surveys#start_survey', as: :start_survey
  get 'research_surveys/:answer_session_id/:question_id', to: 'surveys#ask_question', as: :ask_question
  match 'research_surveys/process_answer', to: 'surveys#process_answer', via: :post, as: :process_answer
  get 'questions/frequencies(/:question_id/:answer_session_id)', to: "surveys#question_frequencies", as: :question_frequencies, format: :json


  # Health Data Section
  get 'data_explore' => 'health_data#explore'
  get 'data_reports' => 'health_data#reports'
  get 'data_medications' => 'health_data#medications'
  get 'data_intro' => 'health_data#intro'



  # Social Section
  match 'social', to: 'social#overview', via: :get, as: 'social' # show
  match 'social/profile', to: 'social#profile', as: 'social_profile', via: :get #edit
  match 'social/profile', to: 'social#update_profile', as: 'update_social_profile', via: [:put, :post, :patch] # update
  match 'locations', via: :get, as: :locations, format: :json, to: 'social#locations'


  # Blog Section
  get 'blog' => 'blog#blog'
  get 'blog_findings' => 'blog#blog_findings'


  # Account Section
  get 'account' => 'account#account'
  get 'account_export' => 'account#account_export'
  get 'consent' => 'account#consent'


  # Admin Section
  get 'admin' => 'admin#users'
  match 'admin/users', to: 'admin#users', as: 'admin_users', via: [:get, :post]
  get 'admin/surveys' => 'admin#surveys', as: 'admin_surveys'
  get 'admin/blog' => 'admin#blog', as: 'admin_blog'
  get 'admin/notifications' => 'admin#notifications', as: 'admin_notifications'
  get 'admin/research_topics' => 'admin#research_topics', as: 'admin_research_topics'

  match 'add_role', to: "admin#add_role_to_user", via: :post, as: :add_role, format: :js
  match 'remove_role', to: "admin#remove_role_from_user", via: :post, as: :remove_role, format: :js
  match 'destroy_user', to: "admin#destroy_user", via: :post, as: :destroy_user, format: :js

  # Development/System
  get 'pprn' => 'application#toggle_pprn_cookie'

  # Voting on Questions
  resources :questions
  match 'vote', to: 'votes#vote', via: :post, as: :vote


  devise_for :user



# # Authentication
#   devise_for :user, skip: [:sessions, :passwords, :confirmations, :registrations]
#   as :user do
#     # session handling
#     get     '/login'  => 'devise/sessions#new',     as: 'new_user_session'
#     post    '/login'  => 'devise/sessions#create',  as: 'user_session'
#     delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'

#     # joining
#     # get   '/join' => 'devise/registrations#new',    as: 'new_user_registration'
#     # post  '/join' => 'devise/registrations#create', as: 'user_registration'

#     # scope '/account' do
#     #   # password reset
#     #   get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
#     #   put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
#     #   post  '/reset-password'        => 'devise/passwords#create'
#     #   get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'

#     #   # confirmation
#     #   get   '/confirm'        => 'devise/confirmations#show',   as: 'user_confirmation'
#     #   post  '/confirm'        => 'devise/confirmations#create'
#     #   get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_user_confirmation'

#     #   # settings & cancellation
#     #   get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
#     #   get '/settings' => 'devise/registrations#edit',   as: 'edit_user_registration'
#     #   put '/settings' => 'devise/registrations#update'

#     #   # account deletion
#     #   delete '' => 'devise/registrations#destroy', as: 'destroy_user_registration'
#     # end
#   end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
