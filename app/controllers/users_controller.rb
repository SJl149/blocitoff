class UsersController < ApplicationController
  def show
    @quote, @author = GlobalConstants::INSPIRATIONAL_QUOTES.sample
    @tasks_todo = current_user.tasks.count
    @expiring_count = current_user.tasks.expiring.size
  end
end
