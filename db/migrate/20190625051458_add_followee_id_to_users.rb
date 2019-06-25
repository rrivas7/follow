class AddFolloweeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :followee, foreign_key: true
  end
end
