class AddStravaUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :strava_username, :string
  end
end
