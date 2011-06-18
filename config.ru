#vim: set filetype=ruby:
unless defined? Bundler
    require 'rubygems'
    require 'bundler'
end
Bundler.require
class FileHelper
    def initialize app
        @app = app
    end
    def call env
        @env["PATH_INFO"] == '/'
        response = Rack::Response.new (@app.call(env))
        response["Content-Type"] = "text/html;charset=utf8" if serving_root
    end
end
run Rack::File.new(".")
