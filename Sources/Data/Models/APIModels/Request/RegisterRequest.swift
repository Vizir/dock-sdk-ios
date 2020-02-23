open class SetPassRequest: M2YModel {
    open var password: String?
    open var password_confirmation: String?
}


open class RegisterUserRequest: M2YModel {
    open var name: String?
    open var email: String?
    open var mothers_name: String?
    open var rg: String?
    open var birth_date: String?
    open var cpf: String?
}

open class RegisterAddressRequest: M2YModel {
    open var street: String?
    open var neighborhood: String?
    open var number: String?
    open var zip: String?
    open var city: String?
    open var state: String?
    open var complement: String?
    open var ref: String?
    open var country: String?
}

open class RegisterSendCodeRequest: M2YModel {
    open var cpf: String?
    open var email: String?
    open var name: String?
    open var phone: String?
}

open class RegisterSendPictureRequest: M2YModel {
    open var type: String?
    open var cpf: String?
    open var personID: String?
    open var image: String?
}
