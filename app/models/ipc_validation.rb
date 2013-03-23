class IpcValidation < App
  def process(sms)
    unless user_code = sms.user_code
      Sms.push(sms.sender_phone, t("code.invalid")); return
    end

    activista = user_code.user

    unless user_code.times_used < 1
      Sms.push(sms.sender_phone, t("code.overuse")); return
    end

    beneficiary = sms.sender

    if beneficiary.interacted?(self)
      Sms.push(sms.sender_phone, "Desculpa, mas ja participaste neste tipo de encontro."); return
    end

    unless activista.activista?(self)
      Sms.push(sms.sender_phone, "A pessoa que te entregou este cartao nao esta autorizada a faze-lo."); return
    end

    if beneficiary.activista?(self)
      Sms.push(sms.sender_phone, "Nao podes implementar actividades para ti mesmo."); return
    end

    beneficiary.interactions.create(name: "participated in IPC", app_id: self.id)
    activista.interactions.create(name: "participated in IPC", app_id: self.id)
    user_code.inc_usage

    troca_aki_code = beneficiary.codes.create(app_id: TrocaAkiValidation.first.id)
    Sms.push(sms.sender_phone, "Vai a um posto TROCA AKI, apresenta este codigo #{troca_aki_code.to_s} e recebe uma garrafa de Certeza. Bebe agua tratada com Certeza e evita as doencas diarreicas."); return
  end
end
