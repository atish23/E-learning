class AddNameToBatches < ActiveRecord::Migration[6.0]
  def change
    add_column :batches, :name, :string
  end
end
