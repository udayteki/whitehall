module PaginationHelper
  def next_page_link(url: nil, page: nil, total_pages: nil)
    link_content = "Next <span class=\"visuallyhidden\">page</span> <span class=\"page-numbers\">#{page} of #{total_pages}</span>".html_safe

    tag.li class: "next" do
      link_to link_content, url, rel: "next"
    end
  end

  def previous_page_link(url: nil, page: nil, total_pages: nil)
    link_content = "Previous <span class=\"visuallyhidden\">page</span> <span class=\"page-numbers\">#{page} of #{total_pages}</span>".html_safe

    tag.li class: "previous" do
      link_to link_content, url, rel: "prev"
    end
  end
end
