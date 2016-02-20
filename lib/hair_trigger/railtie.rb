require 'hair_trigger'
require 'rails'
module HairTrigger
  class Railtie < Rails::Railtie
    railtie_name :hair_trigger

    initializer "hair_trigger.load" do
      ActiveSupport.on_load :active_record do
        HairTrigger.load
      end
    end

    rake_tasks do
      load "tasks/hair_trigger.rake"
    end
  end
end
