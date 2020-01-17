//
//  ChartsManager.swift
//  BarChart
//
//  Created by ksolves on 16/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation
import  UIKit
import  Alamofire

class ChartsManager {
    
    static let shared: ChartsManager = {
        let instance = ChartsManager()
        return instance
    }()
    
    let userId = "10"
    let eventId = "12"
    
    func getCharts(completion: @escaping(ChartsModel?, String?) -> ()) {
        
        let getChartsURL = "https://api.develop-promotixapp.tk/api/v1/mobile/event_dashboard?event_id=12&user_id=10"
        let header = ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjZlMWE4NWQ4Y2Q1ZWJmZWRlYjVjYzMzM2IxZjQ1Zjg1NGUwMGQ3OTRlODIwNTI1Mzg4ZWQzNjZmNDBjNzI3NmVkODJiYzZiOGU0ZjBiYjFjIn0.eyJhdWQiOiIxIiwianRpIjoiNmUxYTg1ZDhjZDVlYmZlZGViNWNjMzMzYjFmNDVmODU0ZTAwZDc5NGU4MjA1MjUzODhlZDM2NmY0MGM3Mjc2ZWQ4MmJjNmI4ZTRmMGJiMWMiLCJpYXQiOjE1NzkwOTMzOTQsIm5iZiI6MTU3OTA5MzM5NCwiZXhwIjoxNjEwNzE1Nzk0LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.X_A6iQ0jol4AaImIqTFEWtqDAIk-Xf85brHEmJE1KEKKld7qfmvcoj43jvwx32tY6bCcZ7Tm5h4qCj1ZsbQC0Pw6Zf3mtfgyHNAlEftvA6qUP5cYFGyuvjTS-aztL5mJt_ES7zT752xWb7Sw4dJsKwvJSbH-j_5INZo3aQZMBs5iaN6dvJqh907w-uOtihupsVJzmfAOx4clhFc2tE3riWs1HhqeHjv-DKYJFjeIhcnPaT3bxZ3jCkno3gTRrXXEGT5-fZMmPacyzpE6zpN-SUunUJLqPYM3SlWt5-2iwf-T1Pl2l9gKNtCXfHtoE8UjnwyU8O-Jk_eSmoUSvhqVeY3hgaDAXg9adF6YzPcgTWg5JVMoeFcm4ldzsL6W6Dve3NSgkoiTk6hwS5jU2lEXWjl8CTu7EVemSacP0jlaZjEhSPN26wNpbHszO6eTfweljgE_8S9inX0cs1g0XOuJeYAuKZK3dO2dX6ONSr3yWRNU6eElGKwWSSspNxHM6VrcgoxYR3eMfxgXEVSLOayIEwZnnvPbi3KSPQLMxq5P_uoQp6jbnNkywIeRPAm97J3Zbtr-idiN9jxAnAjO-AFjy-5WRd5Rw9LfnERAwq5Ko-6GQFgNM7rS2BqddXFjDFrdh70LFTK2JJQQWGwkSFXaI8_vRotE0Ly1z6wyo4ONdLU"]
        
        Alamofire.request(getChartsURL, method: .get, parameters: nil, headers: header).responseJSON {response in
            switch response.result {
                
            case .success:
                print("API call success")
                do{
                    let chart = try JSONDecoder().decode(ChartsModel?.self, from: response.data!)
                    if chart?.status == 200 {
                        print("Status 200")
                        completion(chart, nil)
                    }else if chart?.status ?? 400 > 200 {
                        print("Status !200")
                        completion(chart, chart?.msg)
                    }
                
                }catch {
                    print("Error decoding")
                    completion(nil, error.localizedDescription)
                }
            case .failure(let error):
                print("API call failure")
                completion(nil, error.localizedDescription)
            }
        }
    }
}
