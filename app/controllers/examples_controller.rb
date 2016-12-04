class ExamplesController < ApplicationController
  def index
  end

  def show
    @id = params[:id] or raise "No Visualization"
    @title = @id.capitalize
  end
end
