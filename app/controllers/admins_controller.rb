class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
