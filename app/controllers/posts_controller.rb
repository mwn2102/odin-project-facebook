class PostsController < ApplicationController
      def index
        #create new model instance here
        @post = current_user.posts.build
        @posts = Post.all #need to update to only show user and friend posts
        
        #I had to build the comment here instead of the comments controller
        @comment = current_user.comments.build 
        
        # The following weren't needed: 
        # @comment = Comment.new
        # @comments = Comment.all
        # @comments = @post.comments       
      end
      
      #add edit and update for posts? 
    
      def create
        @post = current_user.posts.build(post_params)
        if @post.save
        #   flash[:success] = "Micropost created!"
          redirect_to root_url
        else
          render root_url
        end
      end
    
      def destroy
        @micropost.destroy
        # flash[:success] = "Micropost deleted"
        redirect_to root_url
      end
      
      private
    
        def post_params
          params.require(:post).permit(:content)
        end
     
    
end
