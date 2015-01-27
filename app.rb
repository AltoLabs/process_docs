require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/respond_with'
require 'json'

class SpendlyDocs < Sinatra::Application
  use Rack::Logger

  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new { File.join(root, 'public') }
  set :html, ->{ File.join(root, 'views') }
  set :docs, ->{ File.join(root, 'docs') }
  set :views, Proc.new { html }

  get '/' do
    @markdown = File.read(File.join(settings.docs, 'conventions.md')).inspect
    erb File.read(File.expand_path('index.html', settings.html))
  end

  get(/docs\/(.*\.md)/) do |splat|
    sanitized_filename = splat.gsub('-', '/')
    docfile_path = File.join(settings.docs, sanitized_filename)
    halt(404) unless File.exists?(docfile_path)

    respond_to do |format|
      format.html {
        # Ensure markdown is wrapped in our 'Chrome'
        redirect "/#/docs/#{splat}"
      }
      format.json {
        {
          doc: {
            # ember requires an ID.  Goood enough ;)
            id: Digest::MD5.file(docfile_path).hexdigest,
            markdown: File.read(docfile_path)
          }
        }.to_json
      }
    end
  end
end
