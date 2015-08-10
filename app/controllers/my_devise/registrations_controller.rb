class MyDevise::RegistrationsController < Devise::RegistrationsController
	
#tworzymy kontroler ktory dziedziczy po tym
#ktory odpowiada za rejestracje z gemu devise
#'super' wrzuca caly kod z metody create z kontrolera
#z ktorego dziedziczymy
#tutaj tylko dodajemy jakies ekstra rzeczy od siebie

	def create
		super
		UserMailer.welcome_email(@user).deliver_now
	end

end