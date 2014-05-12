class BidsController < ApplicationController
  def index
    @auction = Auction.find(params[:auction_id])
    @bids = @auction.bids.all
  end

  def show
  end

end
