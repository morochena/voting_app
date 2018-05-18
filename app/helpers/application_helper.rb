module ApplicationHelper

  # returns full title on per page basis
  def full_title(page_title = '')
    base_title = "This or That"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def static_page? 
    controller_name == 'static_pages'
  end
end
