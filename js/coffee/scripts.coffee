BlogModel = Backbone.Model.extend
	defauls:
		author: ''
		title: ''
		url: ''

BlogCollection = Backbone.Collection.extend()

karlBlog = new BlogModel
	author: "Karl"
	titl: "Karl\'s Blog"
	url: "http://karl.com/blog"

johnBlog = new BlogModel
	author: "John"
	titl: "John\'s Blog"
	url: "http://john.com/blog"

blogs = new BlogCollection([karlBlog, johnBlog])

console.log blogs