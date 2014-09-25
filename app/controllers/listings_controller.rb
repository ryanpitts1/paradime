class ListingsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
  	if params[:location].present? && params[:within].present? && (params[:within].to_i > 0)
	  @search = Listing.near(params[:location],params[:within], order: :distance).search(params[:q])
    else
      @search = Listing.search(params[:q])
    end
    @listings = @search.result.paginate(page: params[:page], per_page: 1, joins: "LEFT OUTER JOIN attachments ON listings.id = attachments.attachable_id", select: "listings.*, COUNT(attachments.id) AS photos", group: "listings.id", order: "listings.created_at DESC, listings.title ASC, listings.id DESC")
  end
  
  def manage
    @listings = Listing.paginate(page: params[:page], per_page: 20, joins: "LEFT OUTER JOIN attachments ON listings.id = attachments.attachable_id", select: "listings.*, COUNT(attachments.id) AS photos", conditions: ["user_id = ?", current_user.id], group: "listings.id", order: "listings.created_at DESC, listings.title ASC, listings.id DESC")
  end
  
  def show
    @listing = Listing.find(params[:id])
    @listing_attachments = Attachment.find(:all, conditions: ["attachable_id = ?", params[:id]], order: "id ASC, title ASC")
  end
  
  def new
    @listing = Listing.new
  end
  
  def create
    @listing = Listing.new(params[:listing])
    @listing.user_id = current_user.id
    if @listing.save
      flash[:success] = "Your new listing has been published!"
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end
  
  def edit
    @listing = Listing.find(params[:id])
    if @listing.user_id == current_user.id
      # user is the owner of this listing
    else
      flash[:error] = "You are not authorized to update the listing!"
      redirect_to listings_path
    end
  end
  
  def update
    @listing = Listing.find(params[:id])
    if @listing.user_id == current_user.id
      if @listing.update_attributes(params[:listing])
	    redirect_to @listing, :notice  => "Your listing has been updated!"
	  else
	    render 'edit'
	  end
    else
      flash[:error] = "You are not authorized to update the listing!"
      redirect_to listings_path
    end
  end
  
  def destroy
    @listing = Listing.find(params[:id])
    if @listing.user_id == current_user.id
   	  @listing.destroy
      redirect_to listings_manage_path, :notice => "Your listing has been successfully removed."
    else
      flash[:error] = "You are not authorized to delete the listing!"
      redirect_to listings_manage_path
    end
  end
end