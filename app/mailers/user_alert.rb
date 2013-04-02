class UserAlert < ActionMailer::Base
  default from: "movercado@oreste.parlatano.org"

def alert_email()
mail to: 'oreste@parlatano.org,macparlant@yahoo.com',
subject: "Final movercado-analysis submission",
body: "Message sent from Oreste Parlatano oreste@parlatano.org, github https://github.com/oresteafrica/movercado_analysis, heroku http://pure-wildwood-1773.herokuapp.com/"
end

def test_email(addbody)
mail to: 'oreste@parlatano.org,macparlant@yahoo.com',
subject: "email test from Oreste Parlatano (oreste@parlatano.org)",
body: addbody
end

end

