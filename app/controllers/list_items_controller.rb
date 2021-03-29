class ListItemsController < ApplicationController
  include CurrentCart
  before_action :set_list_item, only: %i[ show edit update destroy ]
  before_action :set_cart, only: [:create]

  # GET /list_items or /list_items.json
  def index
    @list_items = ListItem.all
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    clothing = Clothing.find(params[:clothing_id])
    @list_item = @cart.add_clothing(clothing)

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to @list_item.cart, notice: "Item added successfully to the cart." }
        format.json { render :show, status: :created, location: @list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to @list_item, notice: "List item was successfully updated." }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @cart = Card.find(session[:cart_id])
    @list_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: "List item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:clothing_id)
    end
end
