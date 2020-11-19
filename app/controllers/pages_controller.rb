class PagesController < ApplicationController
  #Using the time shows to me that the website is still updating and nothing has broken
  def main
  @time = Time.now
  end

  def about
  end

  def contact
  end
end
