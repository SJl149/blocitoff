class UsersController < ApplicationController
  include UsersHelper

  def show
    inspirational_quote =  generate_quote
    @quote = inspirational_quote[0]
    @author = inspirational_quote[1]
  end
end
