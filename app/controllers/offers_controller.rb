class OffersController < ApplicationController
  def index
    # @offers = Offer.all

    @user = current_user
    @offers = Offer.select('offers.*', "#{@user.matching_percentage_calc} AS matching_percentage").order('matching_percentage DESC').geocoded
    @markers = @offers.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }

    end
  end

  def show
    @offer = Offer.find(params[:id])
    @recruiter = Recruiter.new

    @markers = [
      {
        lat: @offer.latitude,
        lng: @offer.longitude
      }
    ]
  end
end
