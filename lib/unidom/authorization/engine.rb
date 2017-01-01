module Unidom
  module Authorization

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Authorization

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
