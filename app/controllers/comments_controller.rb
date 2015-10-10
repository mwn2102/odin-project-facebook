class CommentsController < ApplicationController
    
    def new
    end
    
    def create
        # Don't need the following because I'm passing the post_id in hidden field
        # @post = Post.find(params[:post_id])
        @comment = current_user.comments.build(comment_params)  #works
        
        # Use current_user.comments instead of the following: 
        # @comment = Comment.new(comment_params)
        # @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_url
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_url
    end
    
    private
    
        def comment_params
            params.require(:comment).permit(:post_id, :content)
        end
end
