class BidsController < ApplicationController
  before_filter :load_auction
  def index
    @bids = @auction.bids.all.order(:amount)
  end

  def show
    @bid = @auction.bids.find(params[:id])
  end

  def new
    @bid = @auction.bids.new
  end

  def create
    @bid = @auction.bids.new(bid_params)
    if @bid.save
      redirect_to auction_bids_path(@auction)
    else
      render 'new'
    end
  end

  def destroy
    @bid = @auction.bids.find(params[:id])
    @bid.destroy
    redirect_to auction_bids_path(@auction)
  end

  private
  def bid_params
    params.require(:bid).permit(:amount)
  end

  def load_auction
    @auction = Auction.find(params[:auction_id])
  end

end
