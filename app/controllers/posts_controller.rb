class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

  def index
    @last_posts = Post.order('created_at DESC').limit(10)  #se recogen los 10 posts mas recientes.
    @posts = Post.all(:order => 'created_at DESC')
    @tags = Tag.all
    @comment = Comment.new() # Se crea un comentario vacio que será el que se salve si el usuario escribe un comentario en alguno de los posts.
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def search_result
    # TODO: los resultados de la busqueda no estan ordenados por fecha, habia un problema al añadir 'created_at' DESC
    # Se realizan busquedas de parametros que no pertenecen al modelo Post, sino a modelos asociados (tags y languages) para ello se usa el metodo "joins" http://guides.rubyonrails.org/active_record_querying.html#specifying-conditions-on-the-joined-tables
    puts "entro en el search_result"
    puts "el valor de los parametros es: language = #{params[:language]} y tag = #{params[:tag]}"

    if (params[:tag] != nil && params[:language] != nil)  #se especifica tanto un tag como un language
      puts "se especifico tanto un language como un tag"
      @posts = Post.joins(:tags).joins(:language).where(:tags => {:name => params[:tag]}, :languages => {:name => params[:language]})
    elsif params[:tag] == nil  #se especifica un language
      puts "solo se especifico language"
      # Esta otra forma de expresarlo es igualmente valida, simplemente otro formato: @posts = Post.joins(:language).where('idomas.name' => params[:language])
      @posts = Post.joins(:language).where(:languages => {:name => params[:language]})    #cuidado con los PLURALES Y SINGULARES!!
    else    #se especifica un tag
      puts "solo se especifico tag"
      # Es necesario hacer un joins para acceder a la informacion de los tags que pertenece a otro modelo
      @posts = Post.joins(:tags).where(:tags => {:name => params[:tag]})
      # La que esta implementada es una manera equivalenete de hacer esto:  @posts = Post.all(:include => :tags, :conditions => ["tags.name = ?", params[:tag]]) # Es importante el :include, ya que en este caso posts has many tags.. y si no pones el include no hace la busqueda dentro de los tags tb.
      # con la diferencia de que esta ultima es la forma vieja y menos recomendada
    end


    @last_posts = Post.order('created_at DESC').limit(10) #se recogen los 10 posts mas recientes.
    @tags = Tag.all
    @tag = params[:tag]       #si no se han pasado como parametro simplemente valdran nil
    @language = params[:language]

    @comment = Comment.new() #necesario para rellenar el formulario de un comentario

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(posts_url, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(posts_url, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
