class InvoiceStatesController < ApplicationController
  before_action :set_invoice_state, only: [:show, :edit, :update, :destroy]

  # GET /invoice_states
  # GET /invoice_states.json
  def index
    @invoice_states = InvoiceState.all
  end

  # GET /invoice_states/1
  # GET /invoice_states/1.json
  def show
  end

  # GET /invoice_states/new
  def new
    @invoice_state = InvoiceState.new
  end

  # GET /invoice_states/1/edit
  def edit
  end

  # POST /invoice_states
  # POST /invoice_states.json
  def create
    @invoice_state = InvoiceState.new(invoice_state_params)

    respond_to do |format|
      if @invoice_state.save
        format.html { redirect_to @invoice_state, notice: 'Invoice state was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_state }
      else
        format.html { render :new }
        format.json { render json: @invoice_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_states/1
  # PATCH/PUT /invoice_states/1.json
  def update
    respond_to do |format|
      if @invoice_state.update(invoice_state_params)
        format.html { redirect_to @invoice_state, notice: 'Invoice state was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_state }
      else
        format.html { render :edit }
        format.json { render json: @invoice_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_states/1
  # DELETE /invoice_states/1.json
  def destroy
    @invoice_state.destroy
    respond_to do |format|
      format.html { redirect_to invoice_states_url, notice: 'Invoice state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_state
      @invoice_state = InvoiceState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_state_params
      params.require(:invoice_state).permit(:Name)
    end
end
