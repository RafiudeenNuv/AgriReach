//
//  ServiceApi.swift
//  Quierocasa
//
//  Created by KG Sajith on 06/02/20.
//  Copyright © 2020 KG Sajith. All rights reserved.
//

import UIKit

public class AppEnvironment {
    public static var isProduction: Bool {
        return keyEnvironment == "test"
    }
    public static var isQA: Bool {
        return keyEnvironment == "qa"
    }
    

    static let keyEnvironment: String = (Bundle.main.infoDictionary?["Environment"] as? String) ?? "test"
    static let keyHostName: String = "hostName"
    static let keyHostURL: String = "hostURL"
    static let keyBaseURL: String = "baseURL"
    static let keyBaseRedirectURL: String = "baseRedirectURL"
    static let keyPublicDomain: String = "publicDomain"
    static let keyUserDomain: String = "userDomain"

    static let keyCustomer_register : String = "customer_register"
    static let keyCustomer_login : String = "customer_login"
    static let keyCustomer_forgot_password : String = "customer_forgot_password"
    static let keyProducts : String = "products"
    static let keyCategories : String  = "Categories"
    static let keyvendors_List : String  = "vendors_List"
    static let keyproduct_details : String  = "product_details"
    static let keyaddToCart : String  = "addToCart"
    static let keycartList : String  = "cartList"
    static let keyremoveCartItem : String  = "removeCartItem"
    static let keyCreateAddress : String = "createAddress"
    static let keyupdateItemQuantity : String = "updateItemQuantity"
    static let keyaddressList : String = "addressList"
    static let keysaveAddress : String = "saveAddress"
    static let keydeleteAddress : String = "deleteAddress"
    static let keyeditAddress : String = "editAddress"
    static let keysavePayment : String = "savePayment"
    static let keysaveOrder : String = "saveOrder"
    static let keyaddWishList : String = "addWishList"
    static let keyorderList : String = "orderList"
    static let keyorderDetail : String = "orderDetail"
    static let keywishlist : String = "wishlist"
    static let keycancelOrder : String = "cancelOrder"
    static let keyreturnOrder : String = "returnOrder"
    static let keycustomerDetails : String = "customerDetails"
    static let keysocialLogin : String = "socialLogin"
    static let keysearch : String = "search"
    static let keychange_password : String = "change_password"
    static let keychange_number : String = "change_number"
    static let keysetDefaultAddress : String = "setDefaultAddress"
    static let keycheckOtp : String = "checkOtp"
    static let keyreset_password : String = "reset_password"


    
    
    static let CommonURLs: [String: [String: String]] = [
        "common": [

            "customer_register" : "customer/register?token=true",
            "customer_login" : "customer/login?token=true",
            "customer_forgot_password" : "customer/forgot-password?token=true",
            "products" : "products?token=true",
            "Categories" : "categories?token=true",
            "vendors_List" : "vendor/get?token=true",
            "product_details":"products/",
            "addToCart":"checkout/cart/add/",
            "cartList":"checkout/cart?token=true",
            "removeCartItem":"checkout/cart/remove-item/",
            "createAddress":"addresses/create?token=true",
            "updateItemQuantity":"checkout/cart/update?token=true",
            "addressList":"addresses?token=true",
            "saveAddress":"checkout/save-address?token=true",
            "deleteAddress":"addresses/",
            "editAddress":"addresses/",
            "savePayment":"checkout/save-payment?token=true",
            "saveOrder":"checkout/save-order?token=true",
            "addWishList":"wishlist/add/",
            "orderList":"orders?token=true",
            "orderDetail":"orders/",
            "wishlist":"wishlist?token=true",
            "cancelOrder":"cancelOrder?token=true",
            "returnOrder" : "returnOrder?token=true",
            "customerDetails":"customer/get?token=true",
            "socialLogin":"customer/social_login?token=true",
            "search":"searchProducts",
            "change_password":"customer/change-password?token=true",
            "change_number":"customer/change-number?token=true",
            "setDefaultAddress":"addresses/",
            "checkOtp":"customer/confirm-otp?token=true",
            "reset_password" : "customer/reset-password?token=true"


        ]
    ]
    static let URLs: [String: [String: String]] = [
        
        "test": [
            "hostName": "",
            "hostURL": "",
            "baseURL": "https://kulture.ae/",
            "baseRedirectURL": "",
            "publicDomain": "",
            "userDomain": "api/",
        ],
        "qa": [
            "hostName": "",
            "hostURL": "",
            "baseURL": "https://properties.cityinfoservices.com/mobilapp/",
            "baseRedirectURL": "",
            "publicDomain": "",
            "userDomain": "",
            "photoDomain": ""
        ],
        "production": [
            "hostName": "",
            "hostURL": "",
            "baseURL": "https://properties.cityinfoservices.com/mobilapp/",
            "baseRedirectURL": "",
            "publicDomain": "",
            "userDomain": "",
            "termsAndConditions": ""
        ]
    ]
    
    static func getItem(itemKey: String) -> String {
        var url =  (URLs[keyEnvironment]?[itemKey]) ?? ""
        if url.isEmpty {
            url = (CommonURLs["common"]?[itemKey]) ?? ""
        }
        return url
    }
    
    static var baseURL: String {
        return getItem(itemKey: keyBaseURL)
    }
    static var baseRedirectURL: String {
        return getItem(itemKey: keyBaseRedirectURL)
    }
    static var hostName: String {
        return getItem(itemKey: keyHostName)
    }
    static var hostURL: String {
        return getItem(itemKey: keyHostURL)
    }
    static var publicDomain: String {
        return getItem(itemKey: keyPublicDomain)
    }
    static var userDomain: String {
        return getItem(itemKey: keyUserDomain)
    }

    
    // Services

    static var customer_register: String {
        return baseURL + userDomain + getItem(itemKey: keyCustomer_register)
    }
    
    static var customer_login: String {
           return baseURL + userDomain + getItem(itemKey: keyCustomer_login)
       }
    static var customer_forgot_password: String {
           return baseURL + userDomain + getItem(itemKey: keyCustomer_forgot_password)
       }
    
    static var products: String {
           return baseURL + userDomain + getItem(itemKey: keyProducts)
       }
    
    static var categories: String {
           return baseURL + userDomain + getItem(itemKey: keyCategories)
       }

    static var vendors_List: String {
           return baseURL + userDomain + getItem(itemKey: keyvendors_List)
       }
    
    static var product_details: String {
           return baseURL + userDomain + getItem(itemKey: keyproduct_details)
       }
    
    static var addToCart: String {
           return baseURL + userDomain + getItem(itemKey: keyaddToCart)
       }
    static var cartList: String {
           return baseURL + userDomain + getItem(itemKey: keycartList)
       }
    
    static var removeCartItem: String {
           return baseURL + userDomain + getItem(itemKey: keyremoveCartItem)
       }
    
    static var createAddress: String {
           return baseURL + userDomain + getItem(itemKey: keyCreateAddress)
       }
    
    static var updateItemQuantity: String {
           return baseURL + userDomain + getItem(itemKey: keyupdateItemQuantity)
       }
    
    static var addressList: String {
           return baseURL + userDomain + getItem(itemKey: keyaddressList)
       }
    
    static var saveAddress: String {
           return baseURL + userDomain + getItem(itemKey: keysaveAddress)
       }
    
    static var deleteAddress: String {
           return baseURL + userDomain + getItem(itemKey: keydeleteAddress)
       }

    static var editAddress: String {
           return baseURL + userDomain + getItem(itemKey: keyeditAddress)
       }
    
    static var savePayment: String {
           return baseURL + userDomain + getItem(itemKey: keysavePayment)
       }
    
    static var saveOrder: String {
           return baseURL + userDomain + getItem(itemKey: keysaveOrder)
       }
    
    static var addWishList: String {
           return baseURL + userDomain + getItem(itemKey: keyaddWishList)
       }
    
    static var orderList: String {
           return baseURL + userDomain + getItem(itemKey: keyorderList)
       }
    
    static var orderDetail: String {
           return baseURL + userDomain + getItem(itemKey: keyorderDetail)
       }
    
    static var wishlist: String {
           return baseURL + userDomain + getItem(itemKey: keywishlist)
       }
    
    static var cancelOrder : String{
        return baseURL + userDomain + getItem(itemKey: keycancelOrder)
    }
    static var returnOrder : String{
        return baseURL + userDomain + getItem(itemKey: keyreturnOrder)
    }
    
    static var customerDetails : String{
        return baseURL + userDomain + getItem(itemKey: keycustomerDetails)
    }
    
    static var socialLogin : String{
        return baseURL + userDomain + getItem(itemKey: keysocialLogin)
    }
    
    static var search : String{
        return baseURL + userDomain + getItem(itemKey: keysearch)
    }
    
    static var change_password : String{
        return baseURL + userDomain + getItem(itemKey: keychange_password)
    }
    
    static var change_number : String{
        return baseURL + userDomain + getItem(itemKey: keychange_number)
    }
    
    static var setDefaultAddress : String{
        return baseURL + userDomain + getItem(itemKey: keysetDefaultAddress)
    }
    
    static var checkOtp : String{
        return baseURL + userDomain + getItem(itemKey: keycheckOtp)
    }
    
    static var reset_password : String{
        return baseURL + userDomain + getItem(itemKey: keyreset_password)
    }
}

