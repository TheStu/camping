Rails.application.routes.draw do

  resources :recommendations
  root 'statics#home'
  # get 'about' => 'statics#about', as: 'about'
  get 'contact' => 'statics#contact', as: 'contact'
  get 'search' => 'statics#search', as: 'search'
  get 'feed' => 'posts#feed'
  get 'avantlink_search' => 'statics#avantlink_search'
  get '/sitemaps/sitemap.xml.gz' => redirect('https://tpb-uploads.s3.amazonaws.com/sitemaps/sitemap.xml.gz')
  get '/.well-known/acme-challenge/JXzAI-A57AbK3quMGLxaZIJsDJN1sEQZTWI07HsNbM0', to: 'statics#letsencrypt_no_www'
  get '/.well-known/acme-challenge/6vDWxSVCB2URcmH92C3u51VH9z5iNAbTgLzgMcFqEtE', to: 'statics#letsencrypt_www'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users

  get '/gear-lists/lightweight-tents' => redirect('/gear-lists/tents')
  get '/gear-lists/lightweight-sleeping-bags' => redirect('/gear-lists/sleeping-bags')
  get '/gear-lists/lightweight-backpacks' => redirect('/gear-lists/backpacks')
  get '/gear-lists/lightweight-sleeping-pads' => redirect('/gear-lists/sleeping-pads')
  get '/gear-lists/lightweight-bivy-bags' => redirect('/gear-lists/bivy-bags')
  get '/gear-lists/lightweight-water-filters' => redirect('/gear-lists/water-filters')
  get '/gear-lists/lightweight-stoves' => redirect('/gear-lists/stoves')
  get '/gear-lists/lightweight-trekking-poles' => redirect('/gear-lists/trekking-poles')
  get '/gear-lists/lightweight-tarp-tents' => redirect('/gear-lists/tarps')
  get '/gear-lists/tarp-tents' => redirect('/gear-lists/tarps')

  resources :gears, except: :index, path: '/gear'
  resources :merchant_categories, except: [:index, :show]
  resources :categories, except: :index, path: '/gear-lists'

  get '/gear' => redirect('/')
  get '/index/page' => redirect('/camping-articles')
  get '/camping-articles', to: 'pages#index', as: 'pages'

  resources :posts
  resources :pages, only: [:edit, :show, :update], path: '', constraints: { format: 'html' } #lambda { |req| !['php', 'jsp', 'asp', 'htm', 'html'].include?(req) }
  resources :post_categories, except: :index, path: 'post-category'

  get '/index/post', to: redirect('/')
  get '/:id/:title_param', to: redirect('/posts/%{id}')

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
