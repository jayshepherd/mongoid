# encoding: utf-8
module Mongoid #:nodoc:
  module Extensions #:nodoc:
    module Object #:nodoc:
      # This module converts objects into mongoid related objects.
      module Conversions #:nodoc:
        extend ActiveSupport::Concern
        # Converts this object to a hash of attributes
        def mongoidize
          self.raw_attributes
        end

        module ClassMethods
          def set(value)
            value.respond_to?(:raw_attributes) ? value.raw_attributes : value
          end

          def get(value)
            value ? self.instantiate(value) : value
          end
        end
      end
    end
  end
end
