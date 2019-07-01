class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone
      t.string :email
      t.string :avatar ,default: 'https://pngimage.net/wp-content/uploads/2018/05/default-profile-pic-png-8.png'
      t.string :twitter
      t.string :facebook
      t.string :password_digest

      t.timestamps
    end
  end
end
