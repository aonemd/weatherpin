class BaseDecorator < Geckorate::Decorator
  def created_at_formatted
    created_at.strftime("%d/%m/%Y %H:%M")
  end
end
