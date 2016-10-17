module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def recieve_toy(name)
    self.toys.find_or_create_by(name)
  end
end
