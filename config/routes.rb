Rails.application.routes.draw do
  # Application root
  root 'main#index'

  # Path for leaving messages
  post '/leave_message' => 'main#leave_message'

  # Main dasboard index
  get 'main_webapp/index'
  get 'dashboard' => 'main_webapp#dashboard'
  get 'evangelio' => 'main_webapp#evangelio'

  # Devise configuration
  devise_for :users

  # Semesters and enrollment
  resources :semesters do
    member do
      post 'current'
    end
  end
  resources :group_enrollments
  resources :group_offerings do
    collection do
      get 'lectures'
      get 'workshops'
      get 'commissions'
      get 'shepperdings'
    end
  end
  resources :child_semesters do
    collection do
      get 'current'
    end
    member do
      get 'receipt'
      put 'pay'
      put 'unpay'
    end
  end
  resources :coordinator_semesters do
    collection do
      get 'current'
    end
  end

  # Resources configurations
  resources :notifications do
    collection do
      get 'read'
      post 'mark_as_read'
    end
  end
  resources :notices do
    collection do
      get 'view'
    end
  end
  resources :users do
    member do
      post 'assign_to_workshop'
      post 'assign_to_shepperding'
      post 'assign_to_lecture'
      post 'assign_to_commission'
      post 'assign_child'
      delete 'unassign_from_workshop'
      delete 'unassign_from_shepperding'
      delete 'unassign_from_lecture'
      delete 'unassign_from_commission'
      delete 'unassign_child'
      post 'assign_child'
      delete 'unassign_child'
      delete 'unshare_task'
      post 'toggle_sidebar'
      post 'add_email'
      post 'add_phone'
      get 'edit_tutor'
      get 'edit_coordinator'
      get 'show_tutor'
      get 'show_coordinator'
    end
    collection do
      get 'tutors'
      get 'coordinators'
      get 'new_coordinator'
      get 'new_tutor'
      get 'typeaheaddata'
      get 'profile'
      patch 'update_password'
      patch 'update_profile'
    end
  end
  resources :emails
  resources :phones
  resources :events
  resources :workshops do
    member do
      post 'assign_coordinator'
      delete 'unassign_coordinator'
      post 'enroll_child'
      delete 'unenroll_child'
    end
    collection do
      get 'typeaheaddata'
    end
  end
  resources :lectures do
    member do
      post 'assign_coordinator'
      delete 'unassign_coordinator'
      post 'enroll_child'
      delete 'unenroll_child'
    end
    collection do
      get 'typeaheaddata'
    end
  end
  resources :children do
    member do
      post 'assign_to_tutor'
      delete 'unassign_from_tutor'
      post 'enroll_in_workshop'
      post 'enroll_in_lecture'
      post 'enroll_in_shepperding'
      delete 'unenroll_from_workshop'
      delete 'unenroll_from_lecture'
      delete 'unenroll_from_shepperding'
    end
    collection do
      get 'typeaheaddata'
    end
  end
  resources :visitor_messages
  resources :shepperdings do
    member do
      post 'assign_coordinator'
      delete 'unassign_coordinator'
      post 'enroll_child'
      delete 'unenroll_child'
    end
    collection do
      get 'typeaheaddata'
    end
  end
  resources :commissions do
    member do
      post 'assign_coordinator'
      delete 'unassign_coordinator'
    end
    collection do
      get 'typeaheaddata'
    end
  end
  resources :tasks do
    member do
      post 'assign_to_coordinator'
      delete 'unassign_from_coordinator'
      post 'share_to_coordinator'
      post 'mark_as_completed'
      delete 'unmark_as_completed'
    end
  end
  resources :projects do
    member do
      post 'assign_to_coordinator'
      delete 'unassign_from_coordinator'
      post 'share_to_coordinator'
      post 'mark_as_completed'
      delete 'unmark_as_completed'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
