class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = 'Thanks for commenting!'
      respond_to do |format|
        format.html {redirect_to(posts_url)}
        format.js
      end
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      respond_to do |format|
        format.html {redirect_to(posts_url)}
        format.js
      end
    end
  end

  def eliminar

    #Para especificar bien el comentario es necesario especificar tanto la id del comentario como la del post al q pertenece
    @comment = Comment.find_by_id_and_post_id(params[:id],params[:post_id])

    #ESTO SE PUEDE BORRAR ES PARA DEBUG
    puts "tipo de clase: #{@comment.class}"
    puts "tipo de superclase: #{@comment.class.superclass}"
    ##################################

    @comment.destroy

    puts "tipo de clase despues de eliminar: #{@comment.class}"
    puts "id del objeto: #{@comment.id}"
    respond_to do |format|
      format.html {redirect_to(posts_url)}
      format.js
    end
  end
end
