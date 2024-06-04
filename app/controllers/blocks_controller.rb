class BlocksController < ApplicationController
  before_action :set_block, only: %i[show edit update destroy]

  # GET /blocks
  def index
    @blocks = Block.all
  end

  # GET /blocks/1
  def show; end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit; end

  # POST /blocks
  def create
    @block = Block.new(block_params.merge(user_id: current_user.id))

    if @block.save
      @transactions = CnabParserService.new(block_params[:cnab].tempfile.path).call
      @transactions = @transactions.map { |transaction| transaction.merge(block_id: @block.id) }
      Transaction.insert_all!(@transactions)

      redirect_to @block, notice: 'Block was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  rescue Date::Error => e
    handle_error(e)
  rescue ArgumentError => e
    handle_error(e)
  rescue Errno::ENOENT => e
    handle_error(e)
  rescue StandardError => e
    handle_error(e)
  end

  # PATCH/PUT /blocks/1
  def update; end

  # DELETE /blocks/1
  def destroy
    @block.destroy!
    redirect_to root_path, notice: 'Block was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_block
    @block = Block.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def block_params
    params.require(:block).permit(:cnab, :name)
  end

  def handle_error(err)
    flash[:alert] = err.message
    render :new, status: :unprocessable_entity
  end
end
