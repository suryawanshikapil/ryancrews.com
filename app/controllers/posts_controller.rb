class PostsController < ApplicationController


	before_action :set_random_post_link, only: [ :about, :disclosure, :meta, :show ]


	# About whom?  Perhaps him?  Maybe her?
	def about
		about_post = Post.of_type(Post::POST_TYPE_ABOUT)
		if about_post.present?
			gon.post = about_post.as_json
			render :show
		else
			redirect_to :root
		end
	end


	# The FTC and me, and you, and the things I write
	def disclosure
		disclosure_post = Post.of_type(Post::POST_TYPE_DISCLOSURE)
		if disclosure_post.present?
			gon.post = disclosure_post.as_json
			render :show
		else
			redirect_to :root
		end
	end


	# It's the home page
	def home
		gon.posts = Post.most_recent(6).as_json
	end


	# Paged(?) view of all the posts
	def index
		gon.posts = Post.all.as_json
	end


	# The post about Post
	def meta
		# meta post doesn't have an actual DB category, hence this
		meta_post = Post.meta_post.as_json
		meta_post.merge!(category: Category.meta_category.as_json)
		gon.post = meta_post
		render :show
	end


	# A post
	def show
		gon.post = Post.find_by_id(params[:id]).as_json
	end


	private

		def set_random_post_link
			gon.random_post_link = post_path( Post.offset( rand(Post.count) ).first )
		end


end
