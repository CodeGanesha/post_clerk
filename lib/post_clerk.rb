require 'office_clerk'
require 'office_clerk/post'

module PostClerk
  class Engine < Rails::Engine
    engine_name 'post_clerk'

    config.eager_load_paths += %W(#{config.root}/lib)
    config.eager_load = true

    initializer 'post_clerk' do |app|
      app.config.assets.precompile += %w(post_office.css post_office.js)
    end
  end
end
