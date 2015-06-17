require "feedjira"
require "sinatra"
require "sinatra/json"
require "sinatra/reloader" if development?
require "haml"

require_relative "monkey"

set :protection, :except => [:json_csrf]

configure do
  enable :inline_templates
end

get "/" do
  unless params[:url].to_s.empty?
    json Feedjira::Feed.fetch_and_parse(params[:url])
  else
    haml :index
  end
end

__END__

@@ layout
%html
  %head
    %title Feedjira
  %body
    = yield

@@ index
- url = "#{request.url}?url=http://blogs.msdn.com/rss.aspx"
%p
  Fetches and parses RSS feeds and returns the data in JSON. Example:
  %a{ href: url }= url

%p
  Using
  = succeed "." do
    %a{ href: "https://github.com/feedjira/feedjira" } Feedjira

%p
  Useful with something like the
  = succeed " extension installed." do
    %a{ href: "https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc" } JSONView
