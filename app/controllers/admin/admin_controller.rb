class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  WillPaginate.per_page = 15
  
end