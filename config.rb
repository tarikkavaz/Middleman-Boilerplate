# Settings
# -------------------------------------------------------------------------------------------------
set :css_dir,    'statics/css'
set :js_dir,     'statics/js'
set :images_dir, 'statics/img'
set :relative_links, true

activate :livereload
activate :i18n, :mount_at_root => false, :templates_dir => "pages"
redirect 'index.html', to: '/en/'

config[:host] = "https://domain.com"
config[:sitename] = "Middleman Boilerplate"

# BLog, Data, Serve, Build, Deploy
# -------------------------------------------------------------------------------------------------
activate :blog do |blog|
  blog.layout = "blog-layout"
  blog.prefix = "blog/post"
  blog.permalink = "/{year}/{month}/{day}/{title}.html"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.default_extension = ".erb"
  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"
  blog.year_template = "blog/calendar.html"
  blog.month_template = "blog/calendar.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

activate :directory_indexes

activate :data_source do |c|
  c.root  = "https://newtablab.com/test"
  c.files = { "db.json" => "my_remote_json" }
end

configure :build do
  activate :minify_css
  # activate :minify_javascript
end

configure :development do
  activate :external_pipeline,
    name: :gulp,
    command: "gulp",
    source: "./.tmp",
    latency: 1
end

activate :rsync do |rsync|
  # rsync.staging_server = "123.45.0.56"
  rsync.production_server = "123.45.0.56"
  rsync.path = "/home/deployer/sites/ProjectName"
  rsync.user = "deployer"
end


# Helpers 
# -------------------------------------------------------------------------------------------------
helpers do
  
  # <li class="nav-item active"><a href="/url/" class="nav-link">Menu Item</a></li>
  def nav_item_link_to(link, url, opts={})
    if current_resource.url == url_for(url)
      prefix = '<li class="nav-item active">'
    else
      prefix = '<li class="nav-item">'
    end
    prefix + link_to(link, url, opts) + "</li>"
  end

  # <span class="active"><a href="/url/" class="nav-link">Menu Item</a></span>
  def span_link_to(link, url, opts={})
    if current_resource.url == url_for(url)
      prefix = '<span class="active">'
    else
      prefix = '<span>'
    end
    prefix + link_to(link, url, opts) + "</span>"
  end

  # <a href="/url/" class="anyclassThatIsaleadyThere active">Menu Item</a>
  def active_class(name, url, options={})
    options = {
      class: "",
      active_if: url,
      # page: current_page.url,
    }.update options
    active_url = options.delete(:active_if)
    active = Regexp === active_url ? current_page.url =~ active_url : current_page.url == active_url
    options[:class] += " active" if active
    link_to name, url, options
  end
end