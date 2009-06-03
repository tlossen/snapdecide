class DecisionController < ApplicationController

  before_filter :load_decision, :except => :create

  def view
  end

  def create
    @decision = Decision.new
    if request.post?
      @decision.attributes = params[:decision]
      if @decision.save
        redirect_to :action => :view, :code => @decision.code
      end
    end
  end

  def edit_column
    @participant = Participant.find(params[:participant_id])
    if request.post?
      @participant.answers = collect_answers(params[:answer])
      @participant.save!
      redirect_to :action => :view
    end
  end

  def add_participant
    name = params[:name].strip
    @decision.participants.create :name => name unless name.empty?
    redirect_to :action => :view
  end

  def add_option
    name = params[:name].strip
    unless name.empty?
      @decision.options += "\n" + name
      @decision.save! 
    end
    redirect_to :action => :view
  end

private

  def collect_answers(hash)
    (hash || {}).sort_by {|k,v| k.to_i}.inject('') {|result,e| result + e.last}
  end

  def load_decision
    @decision = Decision.find_by_code(params[:code]) || raise(ActiveRecord::RecordNotFound)
  end

end
