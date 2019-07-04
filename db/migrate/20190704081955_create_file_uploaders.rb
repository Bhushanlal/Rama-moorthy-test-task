class CreateFileUploaders < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploaders do |t|
      t.string :firstname 
      t.string :lastname
      t.string :age
      t.string :sex
      t.timestamps
    end
  end
end
