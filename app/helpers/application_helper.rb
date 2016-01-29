module ApplicationHelper

  # change the default link renderer for will_paginate and add global options
  def paginate(collection , options = {})
    #options = options.merge defaults
    options[:renderer] = BootstrapPagination::Rails
    will_paginate collection, options
  end

  def admin?
    current_user.admin != nil
  end

  def link_text song
    info = song.link
    return "" unless info
    txt = info.split(".")[1]
    txt || ""
  end

end
