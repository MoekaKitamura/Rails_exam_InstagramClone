class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :read, default: false # このカラムに nil（無） という余計な情報が入らないようにデフォルト設定

      t.timestamps
    end
  end
end
