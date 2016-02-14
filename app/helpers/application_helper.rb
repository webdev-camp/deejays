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

  def song_text song
    info = song.link
    return "" unless info
    host = URI.parse(info).host rescue nil
    return "" unless host
    parts = host.split(".")
    parts.delete_at(0) if parts.length == 3
    parts.join(".")
  end

end
