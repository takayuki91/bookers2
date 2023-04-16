class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      # Bookモデルのカラム
      t.string:title
      t.text:body
      t.integer:user_id
      t.timestamps
    end
  end
end
