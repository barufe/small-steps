//
//  StagingEnvironment.swift
//  staging
//
//  Created by T09870 on 25/02/24.
//
class StagingEnvironment:EnvironmentParameters {
    
    var baseURL: String
    var baseDomain: String
    
    init() {
        self.baseURL = "https://508b-190-190-235-117.ngrok-free.app/"
        self.baseDomain = "www.staging.com"
    }
    
}
