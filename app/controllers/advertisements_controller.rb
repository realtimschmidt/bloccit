class AdvertisementsController < ApplicationController
  def index
    @advertisments = Advertisement.all
  end

  def show
  end

  def new
  end

  def create
  end
end
