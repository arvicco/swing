import java.awt.Dimension

module SwingSupport
  module Extensions
    # Module allows including classes to receive attribute values in an *opts* Hash
    # and sets those attributes after object initialization
    module Attributes
      def self.included host
        host.send :extend, ClassMethods
        host.instance_eval do
#          attr_setter :font, :tool_tip_text, :enabled
          alias :new_without_attributes :new
          alias :new :new_with_attributes
        end
      end

      module ClassMethods
        def attributes
          @attributes ||= (superclass.attributes.dup rescue {})
        end

        # Adds settable attributes for a given class, possibly with defaults
        # If defaults are given for attributes, they should be put at the end (as opts)
        def attr_setter *new_attributes
          if new_attributes.last.is_a? Hash
            # Some attributes are given with defaults
            new_attributes_with_defaults = new_attributes.pop
            new_attributes_with_defaults.each { |name, default| attributes[name] = default }
          end
          new_attributes.each { |name| attributes[name] = nil }
        end

        # Sets attributes after calling original new
        def new_with_attributes(*args, &block)
          opts = args.last.is_a?(Hash) ? args.pop : {}
          component = self.new_without_attributes(*args, &block)

          # Extract known attributes given in opts, or known defaults
          attributes = attributes().map do |name, default|
            value = opts.delete name
            result = if default.nil? # No default, return whatever value
                       value
                     elsif default.respond_to? :call # Default is callable, call it with whatever value
                       default.call *value
                     else # Return either non-nil value or default
                       value.nil? ? default : value
                     end
            [name, result] unless result.nil?
          end.compact
          #      yield opts if block_given?
          attributes.each { |(name, value)| component.send "#{name}=", *value }

          # Post-process non-setter opts
          add_component component, opts[:parent]
          component
        end

        # Post-processing (non-setter) options given to initialize
        def add_component component, parent
          parent.add component if parent
        end
      end
    end
  end
end
