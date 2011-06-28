RailsAdmin.config do |config|
  config.included_models = [User, Post, Comment, Authorization]
  config.model Post do
    edit do
      field :title
      field :body, :text do
        ckeditor true
      end
    end
  end
end