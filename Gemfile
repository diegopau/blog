source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'rake'
gem 'magic_encoding'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'omniauth'  #para autenticacion con facebook, twitter, etc...
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'

gem "recaptcha", :require => "recaptcha/rails"

gem 'devise' # Devise must be required before RailsAdmin
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git' #ESTO ES LO QUE HACE QUE SE JODA EL BOTON "STOP" AL QUERER PARAR EL SERVIDOR, TB DEJA DE FUNCIONAR CTRL+C, SI SIGUE PASANDO MIRAR SI ELIMINARLO O INTENTAR ACTUALIZARLO
gem 'paperclip', '2.3.15' # para manegar archivos adjuntos, principalmente imagenes.

gem "nokogiri", '1.4.7'  # para el plugin truncate_html: https://github.com/ianwhite/truncate_html
gem "htmlentities", '4.3.0' # para el plugin truncate_html: https://github.com/ianwhite/truncate_html

gem 'kaminari'

group :development do
  gem 'rspec-rails', '2.6.1'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git' #se ejecuta annotate nombre_modelo y le mete en el modelo información sobre la tabla de la base de datos que representa
end

group :test do

end

group :production do
  gem 'geoip-rails'  # Para saber, a partir de su IP cual es el pais (o incluso ciudad) de origen de una persona
  gem 'therubyracer-heroku'
  gem 'pg'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
