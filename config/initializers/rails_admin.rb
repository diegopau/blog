RailsAdmin.config do |config|
  config.included_models = [User, Post, Comment, Authorization, Tag, Language]
  config.model Post do
    edit do
      field :title
      field :tags
      field :language_id # TODO: si se pone solo language no funciona, si se pone language_id puedo elegir a que language pertenece, pero esto es un bug y quizás haya que volver language solamente pronto.
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