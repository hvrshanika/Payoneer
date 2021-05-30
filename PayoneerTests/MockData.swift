//
//  MockData.swift
//  PayoneerTests
//
//  Created by Shanika Vithanage on 5/30/21.
//

import Foundation

struct MockData {
    
    static let networks = """
                            {
                              "networks": {
                                "applicable": [
                                  {
                                    "code": "DISCOVER",
                                    "label": "Discover",
                                    "method": "CREDIT_CARD",
                                    "grouping": "CREDIT_CARD",
                                    "registration": "OPTIONAL",
                                    "recurrence": "NONE",
                                    "redirect": false,
                                    "links": {
                                      "logo": "https://resources.integration.oscato.com/resource/network/MOBILETEAM/en_US/DISCOVER/logo3x.png",
                                      "self": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/DISCOVER",
                                      "lang": "https://resources.integration.oscato.com/resource/lang/MOBILETEAM/en_US/DISCOVER.json",
                                      "operation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/DISCOVER/charge",
                                      "validation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MOBILETEAM/en_US/DISCOVER/standard/validate"
                                    },
                                    "selected": false,
                                    "inputElements": [
                                      {
                                        "name": "number",
                                        "type": "numeric"
                                      },
                                      {
                                        "name": "expiryMonth",
                                        "type": "integer"
                                      },
                                      {
                                        "name": "expiryYear",
                                        "type": "integer"
                                      },
                                      {
                                        "name": "verificationCode",
                                        "type": "integer"
                                      },
                                      {
                                        "name": "holderName",
                                        "type": "string"
                                      }
                                    ],
                                    "operationType": "CHARGE"
                                  },
                                  {
                                    "code": "MISTERCASH",
                                    "label": "Bancontact/Mister Cash",
                                    "method": "DEBIT_CARD",
                                    "grouping": "DEBIT_CARD",
                                    "registration": "OPTIONAL",
                                    "recurrence": "NONE",
                                    "redirect": false,
                                    "links": {
                                      "logo": "https://resources.integration.oscato.com/resource/network/MOBILETEAM/en_US/MISTERCASH/logo3x.png",
                                      "self": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MISTERCASH",
                                      "lang": "https://resources.integration.oscato.com/resource/lang/MOBILETEAM/en_US/MISTERCASH.json",
                                      "operation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MISTERCASH/charge",
                                      "validation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MOBILETEAM/en_US/MISTERCASH/standard/validate"
                                    },
                                    "selected": false,
                                    "inputElements": [
                                      {
                                        "name": "number",
                                        "type": "numeric"
                                      },
                                      {
                                        "name": "expiryYear",
                                        "type": "integer"
                                      },
                                      {
                                        "name": "expiryMonth",
                                        "type": "integer"
                                      }
                                    ],
                                    "operationType": "CHARGE"
                                  },
                                  {
                                    "code": "PAYFAST",
                                    "label": "PayFast",
                                    "method": "WALLET",
                                    "grouping": "WALLET",
                                    "registration": "NONE",
                                    "recurrence": "NONE",
                                    "redirect": true,
                                    "links": {
                                      "logo": "https://resources.integration.oscato.com/resource/network/MOBILETEAM/en_US/PAYFAST/logo3x.png",
                                      "self": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/PAYFAST",
                                      "lang": "https://resources.integration.oscato.com/resource/lang/MOBILETEAM/en_US/PAYFAST.json",
                                      "operation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/PAYFAST/charge",
                                      "validation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MOBILETEAM/en_US/PAYFAST/standard/validate"
                                    },
                                    "selected": false,
                                    "operationType": "CHARGE"
                                  },
                                  {
                                    "code": "PAYPAL",
                                    "label": "PayPal",
                                    "method": "WALLET",
                                    "grouping": "WALLET",
                                    "registration": "OPTIONAL",
                                    "recurrence": "NONE",
                                    "redirect": true,
                                    "links": {
                                      "logo": "https://resources.integration.oscato.com/resource/network/MOBILETEAM/en_US/PAYPAL/logo3x.png",
                                      "self": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/PAYPAL",
                                      "lang": "https://resources.integration.oscato.com/resource/lang/MOBILETEAM/en_US/PAYPAL.json",
                                      "operation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/PAYPAL/charge",
                                      "validation": "https://api.integration.oscato.com/pci/v1/6076b2feabe8170009d56de4l7ab1tlvai852jekk4s2h2b7it/MOBILETEAM/en_US/PAYPAL/standard/validate"
                                    },
                                    "selected": false,
                                    "contractData": {
                                      "PAGE_ENVIRONMENT": "sandbox",
                                      "JAVASCRIPT_INTEGRATION": "false",
                                      "PAGE_BUTTON_LOCALE": "en_US"
                                    },
                                    "operationType": "CHARGE"
                                  }
                                ]
                              }
                            }
                        """.data(using: .utf8)!
    
    static let emptyNetworksList = """
                            {
                              "networks": {
                                "applicable": []
                              }
                            }
                        """.data(using: .utf8)!
}
