class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all


    #if admin_signed_in?
    #  @thisUser = User.where(id: order.user_id )
    #  @orderedBy = thisUser.first.email
    #end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    
    if user_signed_in?
    
    @order = current_user.orders.new

      todayIs = Date.today.wday
      days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
      @whatDay = days[todayIs]
      @todaysRestaurant = Restaurant.find_by day: @whatDay
      @restName = @todaysRestaurant.name
      @menuURL = @todaysRestaurant.menu_link

    end

  end

  # GET /orders/1/edit
  def edit

    @order = current_user.orders.find(params[:id])

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    @pin = current_user.orders.find(params[:id])

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    
    @pin = current_user.orders.find(params[:id])

    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:content)
    end
end
