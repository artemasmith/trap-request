class Trap < ActiveRecord::Base
  RPARAMS = [:remote_ip, :request_method, :scheme, :query_string, :cookies, :authorization]

end
