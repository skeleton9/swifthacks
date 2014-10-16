# some parts of the code are from https://github.com/plusjade/jekyll-bootstrap/blob/master/Rakefile
require 'fileutils'

$post_ext = "markdown"
$post_dir = "_posts"
$draft_dir = "_drafts"

desc 'start jekyll server for local testing'
task :run do
  system("jekyll serve -w --drafts")
end

desc 'build jekyll site and copy tags out'
task :build do
  system("jekyll build")
  system("jekyll rm -rf ./tags/*")
  system("cp _site/tags/* ./tags")
end

desc 'commit all changes'
task :commit do
  Rake::Task["build"].invoke

  message = ENV['m'] || 'commit changes'
  system("git add -A")
  system("git commit -m '#{message}'")
end

desc 'push changes to github'
task :deploy do
  Rake::Task["commit"].invoke
  system("git checkout gh-pages")
  system("git push origin gh-pages:gh-pages")
end

desc 'create new post'
task :post do
  title = (ENV["title"] || "New Post").split(" ").map(&:capitalize).join(" ")
  tags = ENV["tags"] || "[]"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue => e
	  puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
	  exit -1
	end

  filename = File.join($post_dir, "#{date}-#{slug}.#{$post_ext}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/-/,' ')}\""
    post.puts "tags: #{tags}"
    post.puts "---\n"
  end
end

desc 'create new post as draft'
task :draft do
  title = (ENV["title"] || "New Post").split(" ").map(&:capitalize).join(" ")
  tags = ENV["tags"] || "[]"
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

  filename = File.join($draft_dir, "#{slug}.#{$post_ext}")
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end

  puts "Creating new post as draft: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/-/,' ')}\""
    post.puts "tags: #{tags}"
    post.puts "---\n"
  end
end

desc "move draft to post"
task :publish do
  title = ENV["title"]
  abort("title not set, rake aborted!") if not title

  begin
    date = (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime('%Y-%m-%d')
  rescue => e
    puts "Error - date format must be YYYY-MM-DD, please check you typed it correctly!"
    exit -1
  end

  r = Regexp.new(title)

  filenames = Dir["./" + $draft_dir + "/*.markdown"].map{|name| File.basename(name)}
  if filenames.empty?
    abort("no draft found, rake aborted!")
  end

  matches = filenames.select{|name| r.match(name) }
  print "Mactched Files:\n"
  if not matches.empty?
    matches.each_with_index do |v, i|
      print "[#{i+1}]: #{v}\n"
    end
    print "\n[0]: Cancel\n"
    n = ask("Select the draft you want to publish: ", (0..matches.size).to_a.map{|x| "#{x}"})
    choice = Integer(n)
    if choice == 0
      exit 0
    elsif choice >= 1 and choice <= matches.size
      name = matches[choice - 1]
      print "You have selected file: #{name}\n"
      if ask("Are you sure to change the draf to be a post?", ['y', 'n']) == 'y'
        old_filename = File.join($draft_dir, name)
        new_filename = File.join($post_dir, "#{date}-#{name}")
        if File.exist?(new_filename)
          abort("rake aborted!") if ask("#{new_filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
        end
        FileUtils.mv(old_filename, new_filename)
      end
    else
      abort("Invalid selection #{choice}, rake aborted!")
    end
  else
    abort("No matched draft for#{title} found, rake aborted!")
  end
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
