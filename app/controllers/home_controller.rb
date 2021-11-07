class HomeController < ApplicationController
  def index
    @total = Visitor.all.count
  end
end
