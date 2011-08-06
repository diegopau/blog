source 'http://rubygems.org'

gem 'rails', '3.0.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', '1.3.3'
gem 'rake', '0.9.2'
gem 'omniauth', '0.2.6'  #para autenticacion con facebook, twitter, etc...
gem 'devise' # Devise must be required before RailsAdmin
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git' #ESTO ES LO QUE HACE QUE SE JODA EL BOTON "STOP" AL QUERER PARAR EL SERVIDOR, TB DEJA DE FUNCIONAR CTRL+C, SI SIGUE PASANDO MIRAR SI ELIMINARLO O INTENTAR ACTUALIZARLO
gem 'jquery-rails', '1.0.12'
gem 'paperclip', '2.3.15' # para manegar archivos adjuntos, principalmente imagenes.

gem "nokogiri", '1.4.7'  # para el plugin truncate_html: https://github.com/ianwhite/truncate_html
gem "htmlentities", '4.3.0' # para el plugin truncate_html: https://github.com/ianwhite/truncate_html

gem 'kaminari', '0.12.4'

group :development do
  gem 'rspec-rails', '2.6.1'
  gem 'annotate-models', '1.0.4' #se ejecuta annotate nombre_modelo y le mete en el modelo información sobre la tabla de la base de datos que representa
end

group :test do

end

group :production do
  gem 'geoip-rails'  # Para saber, a partir de su IP cual es el pais (o incluso ciudad) de origen de una persona
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
