# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_beer-totaller_session',
  :secret      => '93f261e42f458a408723e73afb7387f0c118cbce92bd18005a0f8f173d8f374ab2c2383d9e1a096ac1e9ee74a8fa10410b4eddfdf19390ccc9d2013578c5b45e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
