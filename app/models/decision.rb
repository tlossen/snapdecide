class Decision < ActiveRecord::Base

  has_many :participants, :order => :position

  validates_presence_of :question
  validates_uniqueness_of :code

  def before_create
    self.code = Decision.unused_code
    self.people_names.each {|name| self.participants.create :name => name}
  end

  def validate
    if option_names.size < 1
      errors.add_to_base('Please enter at least one option.')
    end
    if people_names.size < 1
      errors.add_to_base('Please enter at least one person.')
    end
  end

  def people_names
    self.people.split(/\n/).map(&:strip).delete_if(&:empty?) rescue []
  end

  def option_names
    self.options.split(/\n/).map(&:strip).delete_if(&:empty?) rescue []
  end

private

  def self.unused_code
    loop do
      code = Decision.random_digits(7)
      return code unless Decision.find_by_code(code)
    end
  end

  def self.random_digits(n)
    self.random_between(10 ** (n - 1), 10 ** n).to_s
  end

  def self.random_between(a, b)
    rand(b - a) + a
  end

end
