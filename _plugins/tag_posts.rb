module Jekyll
	class TagPostsPageGenerator < Generator
		safe true

		def generate(site)
			for tag in site.tags.keys
				site.pages << TagPostsPage.new(site, tag, site.tags[tag])
			end

		end
	end

	class TagPostsPage < Page
		# list of posts of a given tag
		def initialize(site, tag, posts)
			@site = site
			@dir = 'tags'
			@tag = tag
			@posts = posts
			@name = "#{tag}.html"

			self.process(@name)
			self.read_yaml('_layouts', 'tag_posts.html')
			self.data['tag'] = @tag
			self.data['posts'] = @posts
		end
	end
end
