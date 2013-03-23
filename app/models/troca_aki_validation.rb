class TrocaAkiValidation < App
  def process(sms)
    vendor_phone = sms.sender_phone

    unless user_code = sms.user_code
      Sms.push(vendor_phone, t("code.invalid")); return
    end

    unless user_code.times_used < 1
      Sms.push(vendor_phone, t("code.overuse")); return
    end

    sender = sms.sender

    unless sender.vendor?(self)
      Sms.push(vendor_phone, "Sorry you are not a vendor"); return
    end

    customer = user_code.user

    sender.interactions.create(name: "redeemed troca aki code", app_id: self.id)
    customer.interactions.create(name: "redeemed troca aki code", app_id: self.id)
    user_code.inc_usage

    Sms.push(vendor_phone, "Obrigado. Este codigo e valido, por favor entrega 1 garrafa de Certeza ao teu cliente e a PSI vai-te pagar os 10 meticais.")
    Sms.push(customer, "Parabens por trocares o codigo. Usa a garrafa de Certeza para teres agua limpa em casa e evitares as doencas diarreicas.")
  end
end
