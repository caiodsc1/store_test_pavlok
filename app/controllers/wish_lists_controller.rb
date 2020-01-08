class WishListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wish_list, only: %i[show edit update destroy destroy_wish_list_product]
  before_action :set_wish_list_product, only: [:destroy_wish_list_product]
  # GET /wish_lists
  # GET /wish_lists.json
  def index
    @wish_lists = WishList.all
  end

  # GET /wish_lists/1
  # GET /wish_lists/1.json
  def show; end

  # GET /wish_lists/new
  def new
    @wish_list = WishList.new
  end

  # GET /wish_lists/1/edit
  def edit
    sort_opts = params[:sort].present? && params[:sort] == 'cheap' && { price: :asc } ||
                params[:sort].present? && params[:sort] == 'expensive' && { price: :desc } ||
                { name: :asc }

    @categories = MainCategory.includes(categories: [:main_category]).order(name: :asc).all

    if params[:category]
      @products = Product.where(category_id: params[:category]).search(params[:search]).order(sort_opts).page params[:page]
    else
      @products = Product.search(params[:search]).order(sort_opts).page params[:page]
    end
    @products_count = @wish_list.products_count
    @products_price = @wish_list.products_price

    @stripe_publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
  end

  # POST /wish_lists
  # POST /wish_lists.json
  def create
    @wish_list = WishList.new(wish_list_params)

    respond_to do |format|
      if @wish_list.save
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully created.' }
        format.json { render :show, status: :created, location: @wish_list }
      else
        format.html { render :new }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wish_lists/1
  # PATCH/PUT /wish_lists/1.json
  def update
    respond_to do |format|
      if @wish_list.update(wish_list_params)
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully updated.' }
        format.json { render json: @wish_list.to_json(methods: :products_price), status: :ok }
        format.js { render :update_wish_list_product, content_type: 'text/javascript' }
      else
        format.html { render :edit }
        format.json { render json: { errors: @wish_list.errors.messages.values.flatten }, status: :unprocessable_entity }
        format.js { render json: { errors: @wish_list.errors.messages.values.flatten }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  def destroy
    @wish_list.destroy
    respond_to do |format|
      format.html { redirect_to wish_lists_url, notice: 'Wish list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_wish_list_product
    @wish_list_product.destroy
    @wish_list.reload
    respond_to do |format|
      format.html { redirect_to wish_lists_url, notice: 'Wish list product was successfully destroyed.' }
      format.json { render json: @wish_list.to_json(methods: :products_price), status: :ok }
      format.js { render :update_wish_list_product, content_type: 'text/javascript' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wish_list
    @wish_list = current_user.wish_list
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wish_list_params
    params.require(:wish_list).permit(:name, :total_items, :total_price, wish_list_products_attributes: [:product_id])
  end

  def set_wish_list_product
    @wish_list_product = WishListProduct.find_by(wish_list: @wish_list, product: params[:product_id])
  end
end
