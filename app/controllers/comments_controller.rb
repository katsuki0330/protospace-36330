class CommentsController < ApplicationController
  def create
    @prototype = Comment.new(comment_params).prototype
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @prototype = Comment.new(comment_params).prototype
      @comment = Comment.new(comment_params)
      render :"prototypes/show"
    end  
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
