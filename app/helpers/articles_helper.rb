module ArticlesHelper
  def published_date(date)
    "Published #{date.strftime("%b %e, %Y")}" unless date.blank?
  end
end
