class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
        t.string :title
        t.string :url
        t.integer :user_id
        t.string :owner
        t.integer :app_id
        t.timestamps
    end
  end
end
