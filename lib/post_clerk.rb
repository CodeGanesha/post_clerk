require 'office_clerk'
module PostClerk
  class Engine < Rails::Engine
    engine_name 'post_clerk'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'post_clerk' do |app|
      app.config.assets.precompile += %w(post_office.css post_office.js)
    end
  end
end
