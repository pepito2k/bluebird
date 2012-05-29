class HomeController < ApplicationController

  def index
    raise Twitter.user('gonzalorobaina').inspect
    
  end

end
