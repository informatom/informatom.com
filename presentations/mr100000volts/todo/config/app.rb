Volt.configure do |config|
  config.app_secret = '2_6ri1sARWuWnMkVWsdJf7Crirj_ABhqHgXEqrZB3PChcRN8fvGxQVJxAXRG5LnnQwg'

  # Database config all start with db_ and can be set either in the config
  # file or with an environment variable (DB_NAME for example).

  config.db_driver = 'mongo'
  config.db_name = (config.app_name + '_' + Volt.env.to_s)
  config.db_host = 'localhost'
  config.db_port = 27017

  # If you are not running behind something like nginx in production, you can
  # have rack deflate all files.
  # config.deflate = true

  # Public configurations
  # Anything under config.public will be sent to the client as well as the server,
  # so be sure no private data ends up under public
end