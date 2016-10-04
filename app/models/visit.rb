class Visit < ActiveRecord::Base
  belongs_to :contact
  belongs_to :operator

def signed_contract
  if signed_contract?
    'Sim'
  else
    'Não'
  end
end

end
