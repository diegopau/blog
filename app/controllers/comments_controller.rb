# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post
    if verify_recaptcha(:model => @comment)
      puts("cacha verificado correctamente")
      if @comment.save
        flash[:notice] = 'Thanks for commenting!'
        respond_to do |format|
          format.html {redirect_to(@comment.post, :anchor => "comment_form")}
          format.js
        end
      else
        flash[:notice] = "Error creating comment: #{@comment.errors}"
        respond_to do |format|
           format.html {redirect_to(@comment.post, :anchor => "comment_form")}
           format.js
        end
      end
    else
      @post.error_message="Error with captcha try again."
      @post.save
      puts "Error añadido: #{@post.error_message}"
      respond_to do |format|
        format.html {redirect_to(@comment.post,:anchor => "comment_form", :notice => 'Feedback was successfully updated.')}
      end
    end
  end

  def eliminar
    #Para especificar bien el comentario es necesario especificar tanto la id del comentario como la del post al q pertenece
    @comment = Comment.find_by_id_and_post_id(params[:id],params[:post_id])
    @comment.destroy
       respond_to do |format|
      format.html {redirect_to(posts_url)}
      format.js
    end
  end
end
