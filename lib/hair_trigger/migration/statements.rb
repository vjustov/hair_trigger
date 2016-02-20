module HairTrigger
  module Migration
    # Methods that are made available in migrations for managing triggers.
    module Statements
      # Create a new trigger.
      #
      # @param name [String, Symbol] The name of the database trigger.
      # @param options [Hash]
      #
      # @return A hairTrigger::Builder instance to chain other definition
      # methods.
      #
      # @example Create from `db/views/searches_v02.sql`
      # create_trigger(:after_search, compatibility: 1)
      #
      def create_trigger(name = nil, options = {})
        if name.is_a?(Hash)
          options = name
          name = nil
        end
        ::HairTrigger::Builder.new(name, options.merge(:execute => true, :adapter => self))
      end

      # Drop a trigger
      #
      # @param name [String, Symbol] The name of the trigger to drop.
      # @param table [String, Symbol] The name of the table that has the
      # trigger.
      # @param options [Hash]
      #
      def drop_trigger(name, table, options = {})
        ::HairTrigger::Builder.new(name, options.merge(:execute => true, :drop => true, :table => table, :adapter => self)).all{}
      end
    end
  end
end
