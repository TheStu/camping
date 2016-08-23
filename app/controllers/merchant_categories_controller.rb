class MerchantCategoriesController < ApplicationController
  before_action :set_merchant_category, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /merchant_categories
  # GET /merchant_categories.json
  def index
    @merchant_categories = MerchantCategory.all
  end

  # GET /merchant_categories/1
  # GET /merchant_categories/1.json
  def show
  end

  # GET /merchant_categories/new
  def new
    @merchant_category = MerchantCategory.new
  end

  # GET /merchant_categories/1/edit
  def edit
  end

  # POST /merchant_categories
  # POST /merchant_categories.json
  def create
    @merchant_category = MerchantCategory.new(merchant_category_params)

    respond_to do |format|
      if @merchant_category.save
        format.html { redirect_to @merchant_category, notice: 'Merchant category was successfully created.' }
        format.json { render :show, status: :created, location: @merchant_category }
      else
        format.html { render :new }
        format.json { render json: @merchant_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchant_categories/1
  # PATCH/PUT /merchant_categories/1.json
  def update
    respond_to do |format|
      if @merchant_category.update(merchant_category_params)
        format.html { redirect_to @merchant_category, notice: 'Merchant category was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant_category }
      else
        format.html { render :edit }
        format.json { render json: @merchant_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_categories/1
  # DELETE /merchant_categories/1.json
  def destroy
    @merchant_category.destroy
    respond_to do |format|
      format.html { redirect_to merchant_categories_url, notice: 'Merchant category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_category
      @merchant_category = MerchantCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_category_params
      params.require(:merchant_category).permit(:category_id, :merchant_id, :matching_product_group_id)
    end
end
