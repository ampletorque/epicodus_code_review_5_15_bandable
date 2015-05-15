class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, :presence => true)
#  validates(:name, )
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
