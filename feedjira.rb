require "faraday"
require "faraday_middleware"
require "feedjira"
require "rouge"
require "sinatra"
require "sinatra/json"
require "sinatra/reloader" if development?
require "haml"

require_relative "monkey"
require_relative "pretty_xml"

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

get "/xml" do
  unless params[:url].to_s.empty?
    connection = Faraday.new do |faraday|
      faraday.use FaradayMiddleware::FollowRedirects
      faraday.adapter Faraday.default_adapter
      faraday.request :url_encoded
    end

    xml = connection.get(params[:url]).body
    prettyxml = PrettyXML.to_pretty_xml(xml)

    formatter = Rouge::Formatters::HTMLLegacy.new(css_class: 'highlight')
    lexer = Rouge::Lexers::Shell.new
    @code = formatter.format(lexer.lex(prettyxml))
    @css = Rouge::Themes::Github.render(scope: '.highlight')

    haml :prettyxml
  else
    redirect "/"
  end
end

__END__

@@ layout
%html
  %head
    %title Feedjira
  %body
    = yield

@@ prettyxml
%style
  = @css
= @code

@@ index
- url = "#{request.url}?url=https://blogs.msdn.microsoft.com/feed/"
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
