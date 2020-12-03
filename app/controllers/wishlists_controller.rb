class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /wishlists
  def index
    @wishlists = Wishlist.where(user_id: @user.id)

    render json: @wishlists
  end

  # GET /wishlists/1
  def show
    render json: @wishlist
  end

  # POST /wishlists
  def create
    @wishlist = Wishlist.new(wishlist_params)
    @note.user_id = @user.id

    if @wishlist.save
      render json: @wishlist, status: :created, location: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      render json: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishlists/1
  def destroy
    @wishlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlist_params
      params.require(:wishlist).permit(:name, :user_id, :product, :references)
    end
end
