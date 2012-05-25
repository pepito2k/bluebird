module ApplicationHelper
  def yes_no_label(bool)
    if bool
      label = '<span class="label label-success">Yes</span>'
    else
      label = '<span class="label label-important">No</span>'
    end
    label.html_safe
  end
end
