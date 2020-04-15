//
//  APIConstants.swift
//  Mobile2you
//
//  Created by Mobile2You on 18/12/2017.
//  Copyright © 2017 Mobile2You. All rights reserved.
//

import Foundation


var API_URL = ""
var API_TOKEN = ""
var ENCRYPTION_KEY = ""
var ENCRYPTION_IV = ""
var SESSION_TOKEN = ""
var PRODUCT_ID = ""
var BUILD_NUMBER = ""
var VERSION_NUMBER = ""
var APP_NAME = ""

// Login
let POST_SIGNIN = "login/signin"
let POST_REGISTER = "login/register"
let POST_FORGOT_PASS = "login/forgotPass"
let GET_CHECK_CPF = "login/checkCpf"
let GET_CHECK_CODE = "login/checkCode"
let GET_SEND_CODE = "login/resetPassword"
let VALIDATE_ACCOUNT = "login/validateAccount"
let CREATE_INDIVIDUAL = "person/createIndividuals"
let CHECK_CDT_USER = "login/checkDockUser"
let ASSOCIATE_CARD = "login/associateCard"
let CREATE_PERSON = "login/createPerson"
let SEND_FIRST_ACCESS_TOKEN = "login/sendTokenFirstAccess"

// Account
let GET_NOTIFICATIONS = "account/getNotifications"
let GET_ABOUT = "account/getAbout"
let UPDATE_ABOUT = "account/updateAbout"
let UPDATE_PHOTO = "account/updatePhoto"
let UPDATE_LANGUAGE = "account/updateLanguage"
let UPDATE_PASSWORD = "account/updatePassword"
let GET_SUBSCRIBE_INFO = "account/getSubscribeInfo"
let REGISTER_TOKEN = "account/registerToken"
let GET_CHECK_PASSWORD = "account/checkPassword"
let GET_ACCOUNT_IDS = "account/getAccountIds"
let FIND_ACCOUNT = "account/findAccount"
let SEND_SMS = "transaction/sendCode"
let GET_ACCOUNT_SEND_CODE = "transaction/sendCode"
let GET_ACCOUNT_VALIDATE_CODE = "transaction/validateCode"
let GET_TERMS_AND_POLITICS = "account/getTermsAndPolitics"
let GET_ALL_CARDS = "account/getCards"
let ACCOUNT_GET_MONTHS = "account/getAvailableMonths"
let LOGOUT = "account/logout"
let ALIAS_BANK = "account/aliasbank"
let RESET_PASSWORD = "login/resetPassword"

// Cards
let VALIDATE_PASSWORD = "card/passwordValidation"
let GET_CARDS = "card/findCard"
let FIND_CARDS_DATA = "card/findCardData"
let CARD_LIMIT = "card/getCardLimit"
let CREATE_PF_CARD = "card/createPfCard"
let CREATE_PJ_CARD = "card/createPjCard"
let LOCK_CARD = "card/blockCard"
let UNLOCK_CARD = "card/unlockCard"
let CREATE_NEW_CARD = "card/createNewCard"
let UNLOCK_INCORRECT_PASSWORD = "card/unlockedIncorrectPassword"
let CREATE_DEBIT_CARD = "card/createDebitCard"
let REGISTER_PASSWORD = "card/registerPassword"
let CANCEL_CARD = "card/cancelCard"
let ADD_HOLDER = "card/addHolder"
let CHANGE_CARD_PASSWORD = "card/updatePassword"
let POST_ACTIVE_CARD = "card/activateCard"

//CDT Account
let GET_CDT_ACCOUNTS = "account/getAccounts"
let GET_CDT_TRANSACTIONS = "account/getTransactions"
let CREATE_CDT_VIRTUAL_CARD = "account/createVirtualCard"

//CDT Billet
let GET_TICKETS = "billet/getTickets"
let POST_GENERATE_TICKET = "billet/generateTicket"

//CDT Payment
let POST_PAYMENT = "payment/pay"
let GET_VALIDATE = "payment/validate"
let GET_PAYMENT_LIST = "payment/getPayment"
let GET_PAYMENT_ADJUSTMENT = "payment/adjustment"
let GET_NEW_PAYMENT_LIST = "payment/getPayment"

//CDT Recharge
let GET_RECHARGES = "recharge/getRecharges"

//CDT Bank Transfers
let GET_BANK_TRANSFERS = "transfer/getBankTransfers"
let GET_P2P_TRANSFERS = "transfer/getp2pTransfer"
let POST_CREATE_BANK_TRANSFER = "middleware/banktransfers"
let POST_CREATE_P2P_TRANSFER = "middleware/p2ptransfer"
let GET_BANK_TRANSFER_DETAIL = "middleware/transfer/bankTransfer"

//Recharge
let GET_FAVORITES = "recharge/getFavorites"
let ADD_FAVORITE_RECHARGE = "recharge/favoriteRecharge"
let GET_DEALERS_CDT = "recharge/phoneDealersList"
let RECHARGES_CDT = "middleware/recharges"
let CONFIRM_RECHARGE_CDT = "middleware/recharge/confirmRecharge"
let POST_CONFIRM_RECHARGE = "recharge/confirmRecharge"
let PUT_CREATE_RECHARGE_CDT = "middleware/recharges"
let GET_RECHARGE_DETAIL_CDT = "middleware/recharge/getRechargeDetail"

//Transport recharge
let GET_PRODUCTS = "transportcard/getProducts"
let RECHARGE_SPTRANS = "middleware/transportcards/recharge"
let GET_SPTRANS_FAVORITES = "transportcard/getFavorites"
let FAVORITE_SPTRANS = "transportcard/favoriteSptransCard"
let GET_SPTRANS_RECHARGES = "transportcard/getRecharges"

// Transfers
let GET_TRANSFERS = "transfer/getTransfers"
let POST_FAVORITE_TRANSFER = "transfer/favoriteTransfer"

// Person
let GET_PERSON = "person/getPerson"

// Bank
let GET_BANKS = "banks/getBanks"

//CDT Person
let GET_PEOPLE = "middleware/person/getPeople"
let FIND_PERSON = "person/findPersonById"

//CDT Bank SLip
let GET_PDF = "middleware/bank_slip/getPDF"

// P2P
let GET_P2P = "p2p/getP2p"
let GET_P2P_DETAIL = "p2p/destination-details"
let POST_FAVORITE_P2P = "p2p/favoriteP2p"

//CDT Rate
let GET_RATE = "rate/carrierDetails"

// Address
let CHECK_ZIP = "person/checkZipCode"

// Registration
let CHECK_CODE = "registration/checkCode"
let REGISTRER = "registration/register"
let SET_PASSWORD = "registration/setPassword"
let CREATE_ADDRESS = "registration/createAddress"
let SEND_CODE = "registration/sendCode"
let SEND_DOCUMENT = "registration/sendImage"
let SEND_SELFIE = "registration/sendImage"

