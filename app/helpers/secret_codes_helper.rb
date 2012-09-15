module SecretCodesHelper
  def number_of_token_options
    options= []
    [1,10,20,50,100].each do |op|
      options << [op,op]
     end 
  end
end
