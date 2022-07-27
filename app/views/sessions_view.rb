class SessionsView
  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def sucessfully_signed_in
    puts "Bem vindo!"
  end

  def wrong_credentials
    puts "wrong credentials. try again..."
  end
end
