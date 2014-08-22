# comments_controller.rb

class CommentsController < ApplicationController
	def index
		# render :index  #not necessary to render the page.
		post_id = params[:post_id]
		@post = Post.find(post_id)
		@comments = @post.comments

	end

	def new
		post_id = params[:post_id]
		@post = Post.find(post_id)
		@comment = @post.comments.new
	end

	def show
		id = params[:id]
		@comment = Comment.find(id)
	end

	def create
		post_id = params[:post_id]
		@post = Post.find(post_id)
		#figure out :comment
		new_comment = params.require(:comment).permit(:body, :title)
		@comment = @post.comments.create(new_comment)

		redirect_to [@post, :comments]

		#older code :
  	#raise params.inspect - causes error to look at params
  	# Post.create(params[:post]) #here is params object, wrap post object. We can't include this since it will list an ActiveModel::ForbiddenAttributes error, do below instead

  	# new_post = params[:post].permit(:title, :author, :content)
  	# post_created = Post.create(new_post)
  	# new_tag = params[:tag].permit(:name)
  	# tag_created = Tag.create(new_tag)

  	# post_created.tags << tag_created

  	# redirect_to "/posts"
  end

end


