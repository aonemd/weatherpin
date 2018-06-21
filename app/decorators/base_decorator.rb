class BaseDecorator < SimpleDelegator
  def decorate; end

  def created_at_formatted
    created_at.strftime("%d/%m/%Y %H:%M")
  end

  class << self
    def decorate_collection(collection)
      collection.map do |item|
        klass           = item.class
        decorator_klass = klass.to_s.concat('Decorator').safe_constantize
        decorator_klass.new(item).decorate
      end
    end
  end
end
