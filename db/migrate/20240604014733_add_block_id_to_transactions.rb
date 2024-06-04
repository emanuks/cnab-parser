class AddBlockIdToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :block, index: true
  end
end
