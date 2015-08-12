class MyDevise::RegistrationsController < Devise::RegistrationsController
	
#tworzymy kontroler ktory dziedziczy po tym
#ktory odpowiada za rejestracje z gemu devise
#'super' wrzuca caly kod z metody create z kontrolera
#z ktorego dziedziczymy
#tutaj tylko dodajemy jakies ekstra rzeczy od siebie

	def create
		super
		#ewentualnie usunac delay i odkomentowac deliver_now
		UserMailer.delay.welcome_email(@user)#.deliver_now <- gem delayed job tera jest
	end

end