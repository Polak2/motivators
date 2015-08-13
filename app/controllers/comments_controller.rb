class CommentsController < ApplicationController

  def create
  	#@comment = Comment.new(comment_params)
  	@comment = current_user.comments.create(comment_params)
  	
  	if @comment.save
  		redirect_to @comment.mem
  	end
  end

  private
  	def comment_params
  		params.require(:comment).permit(:content, :user_id, :mem_id)
  	end

end
