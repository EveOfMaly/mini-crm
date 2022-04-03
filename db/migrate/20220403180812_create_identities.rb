class CreateIdentities < ActiveRecord::Migration[6.1]
  def change
    create_table :identities do |t|
      t.references :visitor
      t.references :contact
      t.timestamps
    end
  end
end
