class AddUserIdToBlocks < ActiveRecord::Migration[7.1]
  def change
    add_reference :blocks, :user, index: true
  end
end
