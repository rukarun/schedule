class Post < ApplicationRecord
  validates :name, presence: true
  validates :start, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end, "は開始日より前の日付は登録できません。") unless
    self.start <= self.end 
  end
  validates :introduction, presence: true

end
