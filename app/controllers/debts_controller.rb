class DebtsController < ApplicationController
  before_action :set_debt, only: %i[ show edit update destroy ]

  # GET /debts/new
  def new
    @debt = Debt.new
    return unless params[:c]

    @customer = Customer.find(params[:c])
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts or /debts.json
  def create
    @debt = Debt.new(debt_params)
    @debt.user = current_user
    
    respond_to do |format|
      if @debt.save
        format.html { redirect_to customer_url(params[:debt][:customer_id]), notice: "Debt was successfully created." }
        format.json { render :show, status: :created, location: @debt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debts/1 or /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to customer_url(params[:debt][:customer_id]), notice: "Debt was successfully updated." }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1 or /debts/1.json
  def destroy
    @debt.destroy

    respond_to do |format|
      format.html { redirect_to debts_url, notice: "Debt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def debt_params
      params.require(:debt).permit(:amount, :user_id, :customer_id)
    end
end
