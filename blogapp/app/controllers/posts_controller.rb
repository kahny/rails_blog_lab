class PostsController < ApplicationController
	def index
		# render :index  #not necessary to render the page.
		@posts = Post.all
	end

	def new
		render :new #optional
	end

	def show
		id = params[:id]
		@post = Post.find(id)
	end

	def create
  	#raise params.inspect - causes error to look at params
  	# Post.create(params[:post]) #here is params object, wrap post object. We can't include this since it will list an ActiveModel::ForbiddenAttributes error, do below instead
  	new_post = params[:post].permit(:title, :author, :content)
  	post_created = Post.create(new_post)
  	new_tag = params[:tag].permit(:name)
  	tag_created = Tag.create(new_tag)

  	post_created.tags << tag_created

  	redirect_to "/posts"
  end

end
