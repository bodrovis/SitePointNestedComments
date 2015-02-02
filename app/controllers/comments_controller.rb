class CommentsController < ApplicationController
  def index
    @comments = Comment.hash_tree
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create

    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    if verify_recaptcha
      if @comment.save
        flash[:success] = 'Your comment was successfully added!'
        redirect_to root_url
      else
        render 'new'
      end
    else
      flash.delete(:recaptcha_error)
      flash.now[:warning] = 'Invalid captcha'
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :author)
  end
end