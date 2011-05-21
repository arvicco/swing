include Java

import java.awt.Dimension

# Module allows including classes to receive attribute values in an *opts* Hash
# and sets those attributes after object initialization
module AttrSetter
  def self.dim_proc default = nil
    proc do |*args|
      case args.size
        when 2
          Dimension.new *args
        when 1
          case args.first
            when Dimension
              args.first
            when String
              Dimension.new *args.first.split(/x|-|:/, 2)
          end
        when 0
          Dimension.new *default unless default.nil?
      end
    end
  end

  def self.included host
    host.send :extend, ClassMethods
    host.attr_setter :font,
                     :tool_tip_text,
                     :preferred_size => dim_proc,
                     :minimum_size => dim_proc,
                     :maximum_size => dim_proc
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
  end

  # Sets attributes after yielding to a given block (usually to call super).
  # Use this method to wrap super call to *ORIGINAL* J... object, exactly
  # once per each derived view hierarchy. TODO: better way?
  #
  def set_attributes opts
    # Extract known attributes given in opts, to be set after object initialization
    attributes = self.class.attributes.map do |name, default|
      value = opts.delete name
      result = if default.nil? # No default, return whatever value
                 value
               elsif default.respond_to? :call # Default is callable, call it with whatever value
                 default.call *value
               else # Return either non-nil value or default
                 value.nil? ? default : value
               end
      [name, result] if result
    end.compact
    yield opts if block_given?
    attributes.each { |(name, value)| send "#{name}=", *value }
  end
end

