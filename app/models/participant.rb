class Participant < ActiveRecord::Base

  belongs_to :decision
  acts_as_list :scope => :decision_id

  def answer(index)
    answers.ljust(100)[index, 1]
  end

end
