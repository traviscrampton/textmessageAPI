class CreateAddressbook < ActiveRecord::Migration
  def change
    create_table :addressbooks do |t|
      t.string 'owner'
      t.timestamps
    end
    create_table :contacts do |t|
      t.string 'name'
      t.string 'relationship'
      t.string 'phonenumber'
      t.integer 'addressbook_id'
      t.timestamps
    end
  end
end
