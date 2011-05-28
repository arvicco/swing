module SwingSupport
  module Extensions
    # Module allows including classes to process blocks given to constructor
    # If the class defines #add_block_listener method, block is treated as default listener,
    # otherwise, newly constructed object is just yielded to the block
    module Blocks
      def self.included host
        host.send :extend, ClassMethods
        host.instance_eval do
          alias :new_without_blocks :new
          alias :new :new_with_blocks
        end
      end

      module ClassMethods
        def new_with_blocks(*args, &block)
          component = self.new_without_blocks(*args)
          if block_given?
            if component.respond_to? :add_block_listener
              component.add_block_listener &block
            else
              # TODO: some kind of fancy processing of nested blocks/components
              yield component
            end
          end
          component
        end
      end
    end
  end
end
