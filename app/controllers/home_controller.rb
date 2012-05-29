class HomeController < ApplicationController

  def index
    #raise Twitter.user('gonzalorobaina').inspect
    @doc = Pismo::Document.new('http://www.rubyinside.com/cramp-asychronous-event-driven-ruby-web-app-framework-2928.html')
    #raise @doc.inspect

    #doc.title     # => "Cramp: Asychronous Event-Driven Ruby Web App Framework"
    #doc.author    # => "Peter Cooper"
    #doc.lede      # => "Cramp (GitHub repo) is a new, asynchronous evented Web app framework by Pratik Naik of 37signals (and the Rails core team). It's built around Ruby's EventMachine library and was designed to use event-driven I/O throughout - making it ideal for situations where you need to handle a large number of open connections (such as Comet systems or streaming APIs.)"
    #doc.keywords  # => [["cramp", 7], ["controllers", 3], ["app", 3], ["basic", 2], ..., ... ]
    
  end

end
