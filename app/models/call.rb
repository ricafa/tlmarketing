class Call < ActiveRecord::Base
  belongs_to :operator, :foreign_key => 'operator_code'
  belongs_to :contact


  def answer
    if answer?
      'Sim'
    else
      'Não'
    end
  end

  def will_visit
    if will_visit?
      'Sim'
    else
      'Não'
    end
  end
end
