class UsersController < ApplicationController
  include UsersHelper

  def show
    inspirational_quote =  generate_quote
    @quote = inspirational_quote[0]
    @author = inspirational_quote[1]

    @tasks_todo = current_user.tasks.count
  end

  def expiring
    
  end
end
