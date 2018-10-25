//
//  IdmcUtil.swift
//  MCPTT
//
//  Created by Sunil Kumar Yadav on 23/10/18.
//  Copyright © 2018 Harman Connected Services. All rights reserved.
//

import Foundation
import CryptoSwift

public class IdmcUtil {
    
    private static let STATE_PREFIX = "mcptt"
    public class func encode(value: String?, method: String) -> String? {
//        MessageDigest messageDigest = MessageDigest.getInstance(method);
//        messageDigest.update(value.getBytes(StandardCharsets.UTF_8));
//        byte[] hashedValue = messageDigest.digest();
//        return Base64.encodeToString(hashedValue, Base64.NO_WRAP | Base64.NO_PADDING | Base64.URL_SAFE);
        guard let value = value else {
            return nil
        }
        //Need to verify is it correct conversion

        if let codeVerifierBytes = value.data(using: .utf8) {
            var buffer = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            codeVerifierBytes.withUnsafeBytes {
                _ = CC_SHA256($0, CC_LONG(codeVerifierBytes.count), &buffer)
            }
            let codeChallengeBytes = Data(bytes: buffer)
            let codeChallenge = codeChallengeBytes.base64EncodedString()
                .trimmingCharacters(in: .whitespaces)
            return codeChallenge
        }
        return nil
    }
    
    public class func formUri(userName: String?) -> String? {
    
        guard let userName = userName else {
            return nil
        }
    if(userName.contains("tel")||userName.contains("sip")) {
        return userName
        }
    return "tel:"+userName
    }
    
    public class func getNewCodeVerifier() -> String {
        //Need to check is correct encoding
        var buffer = [UInt8](repeating: 0, count: 64)
        _ = SecRandomCopyBytes(kSecRandomDefault, buffer.count, &buffer)
        let codeVerifier = Data(bytes: buffer).base64EncodedString().trimmingCharacters(in: .whitespaces)
        
        return codeVerifier
        
//    SecureRandom random = new SecureRandom();
//    byte[] bytes = new byte[64];
//    random.nextBytes(bytes);
//    return Base64.encodeToString(bytes, Base64.NO_WRAP | Base64.NO_PADDING | Base64.URL_SAFE);
    }
    
    public class func getNewState() -> String {
//    SecureRandom secureRandom = new SecureRandom();
//    return  STATE_PREFIX+secureRandom.nextInt();
        var buffer = [UInt8](repeating: 0, count: 64)
        let  secureRandom = SecRandomCopyBytes(kSecRandomDefault, buffer.count, &buffer)
        return  STATE_PREFIX + String(secureRandom)
    }
}
