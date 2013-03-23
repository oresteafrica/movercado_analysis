class TrocaAkiValidation < App
  def process(sms)
    unless code = sms.code
      Sms.push(sms.sender_phone, t("code.invalid")); return
    end

    unless code.times_used < 1
      Sms.push(sms.sender_phone, t("code.overuse")); return
    end

    sender = sms.sender

    unless sender.vendor?(self)
      Sms.push(sms.sender_phone, "Sorry you are not a vendor"); return
    end

    sender.interactions.create(name: "redeemed troca aki code", app_id: self.id)
    code.user.interactions.create(name: "redeemed troca aki code", app_id: self.id)
    code.inc_usage

    Sms.push(sms.sender_phone, "Give product")
    Sms.push(code.user, "Get product")
  end
end
