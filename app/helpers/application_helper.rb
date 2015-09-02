module ApplicationHelper
  def page_title(separator = ' – ')
    [content_for(:title), 'Monster Beverage'].compact.join(separator)
  end
end
