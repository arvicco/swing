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

      # Post-processing (non-setter) options given to initialize
      # You need to delete processed/consumed options from given Hash
      def post_process opts
        attach_to opts.delete(:parent)
      end

      # Proper way to add generic component to its parent
      def attach_to parent
        parent.add self if parent
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
          opts = args.last.is_a?(Hash) ? args.pop.dup : {}
          component = self.new_without_attributes(*args, &block)

          # Extract known attributes given in opts,
          # run default actions on them, or return known defaults
          attributes = attributes().map do |name, default|
            value = opts.delete name
            result = if default.nil? # No default, use value directly
                       value
                     elsif default.respond_to? :call # Default is callable, call it with whatever value
                       default.call *value
                     elsif default.is_a?(Class) && value.class != default # Default class of this attribute, create new
                       default.new *value unless value.nil?
                     else # Return either non-nil value or default
                       value.nil? ? default : value
                     end
            [name, result] unless result.nil?
          end.compact

          #      yield opts if block_given?

          attributes.each do |(name, value)|
            if component.respond_to? "#{name}="
              component.send "#{name}=", *value
            elsif component.respond_to? "set_#{name}"
              component.send "set_#{name}", *value
            else
              raise "Setter #{name} does not work for #{component}"
            end
          end

          # Post-process non-setter opts (setter opts are already consumed by now)
          component.post_process opts

          # Raises exception if any of the given options left unprocessed
          raise "Unrecognized options: #{opts}" unless opts.empty?
          component
        end
      end
    end
  end
end
