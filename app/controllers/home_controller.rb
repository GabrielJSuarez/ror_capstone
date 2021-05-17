class HomeController < ApplicationController
  before_action :authenticate_user!, except: ['landing']
  def home; end

  def landing; end
end
