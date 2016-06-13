# Models
BlogModel = Backbone.Model.extend
	defauls:
		author: ''
		title: ''
		url: ''

# Collections
BlogCollection = Backbone.Collection.extend()


# Blogs
karlBlog = new BlogModel
	author: "Karl"
	titl: "Karl\'s Blog"
	url: "http://karl.com/blog"

johnBlog = new BlogModel
	author: "John"
	titl: "John\'s Blog"
	url: "http://john.com/blog"

blogs = new BlogCollection [karlBlog, johnBlog]


# jQuery Selectors Caching
$blogList = $ '.blog-list'
$blogListTemplate = $ '.blog-list-template'

# Views

blogView = new Backbone.View.extend
	model: new BlogModel
	tagName: 'tr'
	initialize: () ->
		this.template = $blogListTemplate.html()
	render: () ->
		blogData = this.model.toJSON()

		this.$el.html this.template blogData

blogViews = new Backbone.View.extend
	model: blogs
	el: $blogList
	initialize: () ->
		this.model.on 'add', this.render(), this
	render: () ->
		self = this; 
		this.$el.html ''
		_.each(this.model.toArray(), (blog) ->
			blogView = new blogView model: blog
			self.$el.append blogView.render().$el
		)


# jQuery
$(document).ready () -> 
	$blogForm = $('form[name=blog-form]')

	$blogForm.on 'submit', (e) -> 
		e.preventDefault()
		$this = $ this