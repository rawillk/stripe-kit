//
//  SetupAttempt.swift
//  
//
//  Created by Andrew Edwards on 11/10/20.
//

import Foundation

public struct StripeSetupAttempt: StripeModel {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The value of application on the SetupIntent at the time of this confirmation.
    public var application: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date?
    /// The value of customer on the SetupIntent at the time of this confirmation.
    @Expandable<StripeCustomer> public var customer: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// The value of `on_behalf_of` on the SetupIntent at the time of this confirmation.
    @Expandable<StripeConnectAccount> public var onBehalfOf: String?
    /// ID of the payment method used with this SetupAttempt.
    @Expandable<StripePaymentMethod> public var paymentMethod: String?
    /// Details about the payment method at the time of SetupIntent confirmation.
    public var paymentMethodDetails: StripeSetupAttemptPaymentMethodDetails?
    /// The error encountered during this attempt to confirm the SetupIntent, if any.
    public var setupError: _StripeError?
    /// ID of the SetupIntent that this attempt belongs to.
    @Expandable<StripeSetupIntent> public var setupIntent: String?
    /// Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.
    public var status: StripeSetupAttemptStatus?
    /// The value of usage on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
    public var usage: StripeSetupAttemptUsage?
}

public struct StripeSetupAttemptPaymentMethodDetails: StripeModel {
    public var auBecsDebit: StripeSetupAttemptPaymentMethodDetailsAuBecsDebit?
    /// If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    public var bacsDebit: StripeSetupAttemptPaymentMethodDetailsBacsDebit?
    /// If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    public var bancontact: StripeSetupAttemptPaymentMethodDetailsBancontact?
    /// If this is a `card` PaymentMethod, this hash contains details about the card.
    public var card: StripeSetupAttemptPaymentMethodDetailsCard?
    /// If this is an `card_present` PaymentMethod, this hash contains details about the Card Present payment method.
    public var cardPresent: StripeSetupAttemptPaymentMethodDetailsCardPresent?
    /// If this is a `ideal` payment method, this hash contains confirmation-specific information for the `ideal` payment method.
    public var ideal: StripeSetupAttemptPaymentMethodDetailsIdeal?
    /// If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    public var sepaDebit: StripeSetupAttemptPaymentMethodDetailsSepaDebit?
    /// If this is a sofort PaymentMethod, this hash contains details about the SOFORT payment method.
    public var sofort: StripeSetupAttemptPaymentMethodDetailsSofort?
    /// The type of the PaymentMethod, one of `card` or `card_present`. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    public var type: StripePaymentMethodType?
}

public struct StripeSetupAttemptPaymentMethodDetailsAuBecsDebit: StripeModel {
    
}

public struct StripeSetupAttemptPaymentMethodDetailsBacsDebit: StripeModel {
    
}

public struct StripeSetupAttemptPaymentMethodDetailsBancontact: StripeModel {
    /// Bank code of bank associated with the bank account.
    public var bankCode: String?
    /// Name of the bank associated with the bank account.
    public var bankName: String?
    /// Bank Identifier Code of the bank associated with the bank account.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripePaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripeMandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Preferred language of the Bancontact authorization page that the customer is redirected to. Can be one of en, de, fr, or nl
    public var preferredLanguage: StripeSetupAttemptPaymentMethodDetailsBancontactPreferredLanguage?
    /// Owner’s verified full name. Values are verified or provided by Bancontact directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
}

public enum StripeSetupAttemptPaymentMethodDetailsBancontactPreferredLanguage: String, StripeModel {
    case en
    case de
    case fr
    case nl
}

public struct StripeSetupAttemptPaymentMethodDetailsCard: StripeModel {
    /// Populated if this authorization used 3D Secure authentication.
    public var threeDSecure: StripeSetupAttemptPaymentMethodDetailsCardThreeDSecure?
}

public struct StripeSetupAttemptPaymentMethodDetailsCardThreeDSecure: StripeModel {
    /// For authenticated transactions: how the customer was authenticated by the issuing bank.
    public var authenticationFlow: StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureAuthenticationFlow?
    /// Indicates the outcome of 3D Secure authentication.
    public var result: StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureResult?
    /// Additional information about why 3D Secure succeeded or failed based on the `result`.
    public var resultReason: StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureResultReason?
    /// The version of 3D Secure that was used.
    public var version: String?
}

public enum StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureAuthenticationFlow: String, StripeModel {
    /// The issuing bank authenticated the customer by presenting a traditional challenge window.
    case challenge
    /// The issuing bank authenticated the customer via the 3DS2 frictionless flow.
    case frictionless
}

public enum StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureResult: String, StripeModel {
    /// 3D Secure authentication succeeded.
    case authenticated
    /// The issuing bank does not support 3D Secure, has not set up 3D Secure for the card, or is experiencing an outage. No authentication was peformed, but the card network has provided proof of the attempt.
    /// In most cases the attempt qualifies for liability shift and it is safe to make a charge.
    case attemptAcknowledged = "attempt_acknowledged"
    /// 3D Secure authentication cannot be run on this card.
    case notSupported = "not_supported"
    /// The customer failed 3D Secure authentication.
    case failed
    /// The issuing bank’s 3D Secure system is temporarily unavailable and the card network is unable to provide proof of the attempt.
    case processingError = "processing_error"
}

public enum StripeSetupAttemptPaymentMethodDetailsCardThreeDSecureResultReason: String, StripeModel {
    /// For `not_supported`. The issuing bank does not support 3D Secure or has not set up 3D Secure for the card, and the card network did not provide proof of the attempt.
    /// This occurs when running 3D Secure on certain kinds of prepaid cards and in rare cases where the issuing bank is exempt from the requirement to support 3D Secure.
    case cardNotEnrolled = "card_not_enrolled"
    /// For `not_supported`. Stripe does not support 3D Secure on this card network.
    case networkNotSupported = "network_not_supported"
    /// For `failed`. The transaction timed out: the cardholder dropped off before completing authentication.
    case abandoned
    /// For `failed`. The cardholder canceled authentication (where possible to identify).
    case canceled
    /// For `failed`. The cardholder was redirected back from the issuing bank without completing authentication.
    case rejected
    /// For `processing_error`. Stripe bypassed 3D Secure because the issuing bank’s web-facing server was returning errors or timeouts to customers in the challenge window.
    case bypassed
    /// For `processing_error`. An invalid message was received from the card network or issuing bank. (Includes “downgrades” and similar errors).
    case protocolError = "protocol_error"
}

public struct StripeSetupAttemptPaymentMethodDetailsCardPresent: StripeModel {
    /// The ID of the Card PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripeCard> public var generatedCard: String?
}

public struct StripeSetupAttemptPaymentMethodDetailsIdeal: StripeModel {
    /// The customer’s bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    public var bank: StripeSetupAttemptPaymentMethodDetailsIdealBank?
    /// The Bank Identifier Code of the customer’s bank.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripePaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripeMandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Owner’s verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
}

public enum StripeSetupAttemptPaymentMethodDetailsIdealBank: String, StripeModel {
    case abnAmro = "abn_amro"
    case asnBank = "asn_bank"
    case bunq
    case handelsbanken
    case ing
    case knab
    case moneyou
    case rabobank
    case regiobank
    case revolut
    case snsBank = "sns_bank"
    case triodosBank = "triodos_bank"
    case vanLanschot = "van_lanschot"
}

public struct StripeSetupAttemptPaymentMethodDetailsSepaDebit: StripeModel {
    
}

public struct StripeSetupAttemptPaymentMethodDetailsSofort: StripeModel {
    /// Bank code of bank associated with the bank account.
    public var bankCode: String?
    /// Name of the bank associated with the bank account.
    public var bankName: String?
    /// Bank Identifier Code of the bank associated with the bank account.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripePaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<StripeMandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Preferred language of the Sofort authorization page that the customer is redirected to. Can be one of `en`, `de`, `fr`, or `nl`
    public var preferredLanguage: StripeSetupAttemptPaymentMethodDetailsSofortPreferredLanguage?
    /// Owner’s verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
}

public enum StripeSetupAttemptPaymentMethodDetailsSofortPreferredLanguage: String, StripeModel {
    case en
    case de
    case fr
    case nl
}

public enum StripeSetupAttemptStatus: String, StripeModel {
    case requiresConfirmation = "requires_confirmation"
    case requiresAction = "requires_action"
    case processing
    case succeeded
    case failed
    case abandoned
}

public struct StripeSetupAttemptList: StripeModel {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [StripeSetupAttempt]?
}

public enum StripeSetupAttemptUsage: String, StripeModel {
    case offSession = "off_session"
    case onSession = "on_session"
}