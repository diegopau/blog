class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

  def index
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
    # Se realizan busquedas de parametros que no pertenecen al modelo Post, sino a modelos asociados (tags e idiomas) para ello se usa el metodo "joins" http://guides.rubyonrails.org/active_record_querying.html#specifying-conditions-on-the-joined-tables

    if (params[:tag] != nil && params[:idioma] != nil)  #se especifica tanto un tag como un idioma
      puts "paso1"
      @posts = Post.all(:include => :tags, :conditions => ["tags.id = ? AND idioma.name = ?", params[:tag], params[:idioma]])
    elsif params[:tag] == nil  #se especifica un idioma
      puts "paso2"
      @posts = Post.joins(:idioma).where(:idioma => {:name => params[:idioma]})
      puts " Encontre los siguientes posts "
      @posts.each do |post|
        holaaaa
        puts post.title
        puts post.idioma.name
      end
    else    #se especifica un tag
      puts "paso3"
      # Es necesario hacer un joins para acceder a la informacion de los tags que pertenece a otro modelo
      @posts = Post.joins(:tags).where(:tags => {:name => params[:tag]})
      # La que esta implementada es una manera equivalenete de hacer esto:  @posts = Post.all(:include => :tags, :conditions => ["tags.name = ?", params[:tag]]) # Es importante el :include, ya que en este caso posts has many tags.. y si no pones el include no hace la busqueda dentro de los tags tb.
      # con la diferencia de que esta ultima es la forma vieja y menos recomendada
    end
     puts "sisisi"

    @tags = Tag.all
    @tag = params[:tag]
    @comment = Comment.new()
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
