'use strict'

rcblogAppServicesModule = angular.module("rcblogApp.services")

rcblogAppServicesModule.factory("Post", 
	[ "$sce", "Category", ($sce, Category) ->
		
		class Post
			
			constructor: (json={}) ->
				@created_at = json.created_at ? ""
				@html_content = if json.html_content? then $sce.trustAsHtml(json.html_content) else ""
				@id = json.id ? null
				@teaser_text = json.teaser_text ? ""
				@title = json.title ? ""
				@updated_at = json.updated_at ? ""

				@category = if json.category? then new Category(json.category) else new Category()


			categoryName: ->
				"#{@category?.name}"


			showLink: ->
				if @id?
					"/posts/#{@id}"
				else
					"/posts/meta"


			@posts_from_json_posts: (json_posts_array) ->
				# Create class versions of json posts in the array
				new Post(post) for post in json_posts_array

])