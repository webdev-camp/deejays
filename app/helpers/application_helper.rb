module ApplicationHelper
  # change the default link renderer for will_paginate and add global options
def paginate(collection , options = {})
  #options = options.merge defaults
  options[:renderer] = BootstrapPagination::Rails
  will_paginate collection, options
end

end
