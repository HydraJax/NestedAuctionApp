class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    # binding.pry
    @auction = Auction.create(auction_params)
    redirect_to auctions_path
  end

  private
  def auction_params
    params[:auction].permit(:title, :description, :bids_attributes=>[:amount])
  end
end
