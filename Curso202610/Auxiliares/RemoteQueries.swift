//
//  RemoteQueries.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 29/10/26.
//

import Foundation
import Alamofire
import SVProgressHUD


protocol rqDelegate: AnyObject {
    func querySuccess(result: RespuestaServicios, cons: String)
    func queryError(error: String)
}

class RemoteQueries {//100|usr|psw

    func remoteQuery(query:String, cons: String, delegate: rqDelegate){
        let strData = query.data(using: .utf8)
        let str = strData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue:0)) ?? ""
        let parameters = ["datacog":str]
        print(parameters)

        AF.request("https://cognitus.administradordemo.info/processrequest/processrequest-add",
                   method: .post,
                   parameters: parameters,
                   encoder: URLEncodedFormParameterEncoder(destination: .httpBody))
        .responseDecodable(of: RespuestaServicios.self) { response in
            switch response.result {
            case .success(let data):
                if data.valid == 1 {
                    delegate.querySuccess(result: data, cons: cons)
                }else{
                    delegate.queryError(error: data.message ?? "")
                    SVProgressHUD.showError(withStatus: "Error: \(data.message ?? "")")
                }
            case .failure(let error):
                SVProgressHUD.showError(withStatus: "Error: \(error.localizedDescription)")
                print(error)
            }
        }

    }
}
