//
//  ApiRegisterDataSource.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import Foundation

import Alamofire

protocol ApiRegisterDataSource{
    func register(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseDto, Error>) -> Void)
}


class ApiRegisterDataSourceImp: ApiRegisterDataSource {
    var networking: Networking
    private let path : String = "api/v1/auth/sign-up"
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func register(user: RegisterUserParameters, completion: @escaping (Result<RegisterResponseDto, Error>) -> Void) {
        
        let parameters: [String: String] = [
            "email": user.email,
            "password": user.password,
            "username": user.username
        ]
        print(parameters)
        print("\(ProductionEnvironment().baseURL + path)")
        
        networking.request(urlBase: "\(ProductionEnvironment().baseURL + path)", method: .post, parameter: parameters, encoding: URLEncoding.default) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseDto = try decoder.decode(RegisterResponseDto.self, from: data)
                    completion(.success(responseDto))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    

    
}



