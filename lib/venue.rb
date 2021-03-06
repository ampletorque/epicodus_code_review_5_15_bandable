class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  validates(:name, uniqueness: true)
  before_save(:capitalize_me)

  private

  def capitalize_me
    pieces = self.name.split(" ")
    pieces.each do |piece|
      piece.capitalize!
    end
    self.name = pieces.join(" ")
  end
end
