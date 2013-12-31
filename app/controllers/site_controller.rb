class SiteController < ApplicationController
  require "execjs"
  require "open-uri"
  def index
  
  end
  
  def task
    script = File.join(Rails.root.to_s + "/app/assets/javascripts/tmp.js")
    source = open(script).read
    context = ExecJS.compile(source)
    context.call("my")
  end
  
end
