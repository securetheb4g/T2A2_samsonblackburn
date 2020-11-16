class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:buy]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy]
  before_action :authenticate_user!
  rescue_from ActiveModel::RangeError, with: :invalidity
  rescue_from ActiveRecord::RecordNotFound, with: :invalidity
  # before_action :check_roles
  

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end
  
  def buy
    Stripe.api_key = ENV['STRIPE_API_KEY']
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url(params[:id]),
      cancel_url: cancel_url(params[:id]),
      line_items: [
        {
          price_data: {
            currency: 'aud',
            product_data: {
              name: @product.name
            },
            unit_amount: (@product.price * 100).to_i
          },
          quantity: 1
        }
      ]
    })

    render json: session
  end
  #If a user purchases an item it renders a success message
  def success
    render plain: "Your order has been placed." 
  end
  #If a user cancels their order it returns them to the home page
  def cancel
    redirect_to root_path
  end
  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def invalidity
      logger.error "Attempted an invalid action"
      redirect_to root_path, notice: "Invalid Data Entry"
    end
    # def check_roles
    #   if !current_user.has_role?(:admin)
    #     flash[:alert] = "You aren't allowed to be here you cheeky devil!"
    #     redirect_to root_path
    #   end
    # end


    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :image)
    end
end
