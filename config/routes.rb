Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" posts/:post_id/comments/:id
  get 'metrics/most_bookmarked_projects/:site/:month', :to => 'metrics#most_bookmarked_projects'
  get 'metrics/best_performant_sites/:month',          :to => 'metrics#best_performant_sites'
  get 'metrics/bookmarks_per_month/:month',             :to => 'metrics#bookmarks_per_month'
end
