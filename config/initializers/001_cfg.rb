module Cfg
  def self.[](key)
    Rails.application.config.app[key.to_s]
  end
end
