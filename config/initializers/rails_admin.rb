RailsAdmin.config do |config|
  config.included_models = [User, Post, Comment, Authorization, Tag, Idioma]
  config.model Post do
    edit do
      field :title
      field :tags
      field :idioma_id # si se pone solo idioma no funciona, si se pone idioma_id puedo elegir a que idioma pertenece.
      field :body, :text do
        ckeditor true
      end

    end
  end
  config.model Tag do
    edit do
      field :name
      field :posts
    end
  end

end