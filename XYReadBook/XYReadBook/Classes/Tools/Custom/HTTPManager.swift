

import UIKit
import ObjectMapper
import MapKit
import Alamofire
extension HTTPManager {
    
    /// 最简单的请求方式, 没有复杂的错误判断
    static func simpleRequest(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, success: @escaping ([String: Any]?)->(), failure: @escaping (Error?)->()) {
        
      
        HTTPManager.shared.request(url, method: method, parameters: parameters).responseJSON { (dataResponse) in
           
            if let json = dataResponse.result.value as? [String: Any] {
                    success(json)
                } else {
                
                failure(dataResponse.error)
            }
        }
    }
}


/// 1. 这个需要成功和失败两个回调分开
extension HTTPManager {
    
    static func GET(url: String, parameters: [String: Any]? = nil, success: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        request(url: url, method: .get, parameters: parameters, success: success, failure: failure)
    }
    
    static func POST(url: String, parameters: [String: Any]? = nil, success: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        request(url: url, method: .post, parameters: parameters, success: success, failure: failure)
    }
    

    /// 1.0 默认请求--返回Json, 与 1.1 无区别, 仅仅是名称更短一点
    ///
    /// - Parameters:
    ///   - url:        可以是 String, 或者 Url
    ///   - method:     请求方式
    ///   - parameter:  参数字典
    ///   - success:    成功回调
    ///   - failure:    失败回调
    static func request(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, success: @escaping (Any)->(), failure: @escaping (Error?)->()) {
        requestJson(url: url, method: method, parameters: parameters, success: success, failure: failure)
    }
    
    /// 1.1 Json请求--返回Json
    ///
    /// - Parameters:
    ///   - url:        可以是 String, 或者 Url
    ///   - method:     请求方式
    ///   - parameter:  参数字典
    ///   - success:    成功回调
    ///   - failure:    失败回调
    static func requestJson(url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, success: ((Any)->())? = nil, failure: ((Error?)->())? = nil) {
        commonRequest(url: url, method: method, parameters: parameters) { (json: [String: Any]?, error: Error?) in
            if let json = json, error == nil {
                success?(json)
              
            } else {
            failure?(error)
            }
        }
    }
    
    
}
/// 2. 这个只需要一个完成回调,
extension HTTPManager {
    
    static func requestJson(
        url: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        compeleted: @escaping ([String: Any]?, Error?)->())
    {
        commonRequest(url: url, method: method, parameters: parameters, compeleted: compeleted)
    }
}

class HTTPManager {
  
     static let baseURLString = "http://api.zhuishushenqi.com/"
    static let shared:SessionManager = {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        /// 设置超时时间
        configuration.timeoutIntervalForResource = 30
        
       return SessionManager(configuration:configuration)
    }()

   
    /// 基础请求--统一回调的方式
    ///
    /// - Parameters:
    ///   - url:        可以是 String, 或者 Url
    ///   - method:     请求方式
    ///   - parameter:  参数字典
    ///   - compeleted: 结束回调(参数1: [String: Any]? 或者 Data?, 参数2: error?)
    static func commonRequest<T: Serializable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        compeleted: @escaping (T?, Error?)->())
    {
   
        let fullUrl = baseURLString.appending(url)
        HTTPManager.shared.request(fullUrl, method: method, parameters: parameters).response { (response) in
            
            var error: Error
            if let data = response.data, data.count > 0 {
                if let rsp = (try? JSONSerialization.jsonObject(with: data, options: [.mutableLeaves,.mutableContainers,.allowFragments])){
                    
                    var json: T?
                    if let dict = rsp as? [String:Any] {
                        json = dict as? T
                    
                    }else if let array = rsp as?[Any] {
                        json = ["array": array]as? T
                    }

    
                    compeleted(json, nil)
                } else if let data = data as? T {
                    //  不能转直接返回 Data
                    compeleted(data, nil)
                }else {
                
                    if let string = String(data: data, encoding: .utf8) {
                        error = NSError(domain: "HTTPManager", code: -10000, userInfo: [NSLocalizedDescriptionKey: "Json解析失败, 可以解析成Utf-8字符串: \(string)"])
                        
                    }else {
                     
                        error = NSError(domain: "HTTPManager", code: response.response?.statusCode ?? -10001, userInfo: [NSLocalizedDescriptionKey: "失败原因: 不能解析数据, 泛型参数只能是字典[String: Any], 或者Data"])
                    }
                    compeleted(nil, error)
                }
                
            } else {
                
                if response.error != nil {
                    error = response.error!
                    
                } else {
                    error = NSError(domain: "HTTPManager", code: response.response?.statusCode ?? -10002, userInfo: [NSLocalizedDescriptionKey: "未知原因: 没有数据, 也没有错误原因: \(response)"])
                }
                compeleted(nil, error)
            }
        }
    }
    
    
    
    /// MARK 带网络缓存,直接返回转好模型的对象
    /// 此方法会回调两次,如果有缓存,直接返回.等数据请求下来,再次返回
    static func requestModel<T: BaseResponse>(
        url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        iscaChe:Bool? = true,
        compeleted: @escaping (T?, Error?)->())
    {
        var urlKey = ""
        //  把baseURL拼起来
        let fullUrl = baseURLString.appending(url as! String)
        
        if let parDict = parameters {
            let data : NSData! = try? JSONSerialization.data(withJSONObject:parDict, options: []) as NSData!
            let str = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)! as String
            urlKey = fullUrl + str
        }
        
        if(urlKey == ""){
            urlKey = fullUrl
        }
        
        //        XWJLog(messsage: urlKey)
        if iscaChe == true {
            /// MARK 缓存
            let iscontains = HTTPCache.xwj_containsObject(forKey: urlKey)
            if(iscontains == true){
                let json =  HTTPCache.xwj_objectForKey(forkey: urlKey)
                if let model =  HTTPCache.objectModel(jsonString: json as! String) as T?{
                    compeleted(model, nil)
                }
            }
        }
        
        HTTPManager.shared.request(fullUrl, method: method, parameters: parameters).response(completionHandler: { (response) in
            
            var error: Error
            if let data = response.data, data.count > 0 {
                
                if let jsonObj = (try? JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves, .allowFragments])) {
                    //  先转json
                    var json = [String: Any]()
                    if let dict = jsonObj as? [String: Any] {   //  字典
                        json = dict
                    }
                    if let array = jsonObj as? [Any] {  //  数组包装为字典
                        json = ["array": array]
                    }
                    
                    //  直接解析成模型返回
                    let map = Map.init(mappingType: .fromJSON, JSON: json)
                    let rsp = T.self.init(map: map)
                    if iscaChe == true {
                        HTTPCache.store(rsp, forKey: urlKey)
                    }
                    
                    compeleted(rsp, nil)
                    
                } else {
                    
                    if let string = String(data: data, encoding: .utf8) {
                        error = NSError(domain: "HTTPManager", code: -10000, userInfo: [NSLocalizedDescriptionKey: "Json解析失败, 可以解析成Utf-8字符串: \(string)"])
                    } else {
                        error = NSError(domain: "HTTPManager", code: response.response?.statusCode ?? -10001, userInfo: [NSLocalizedDescriptionKey: "失败原因: 不能解析数据, 泛型参数只能是字典[String: Any], 或者Data"])
                    }
                    compeleted(nil, error)
                }
            } else {
                
                if response.error != nil {
                    error = response.error!
                } else {
                    error = NSError(domain: "HTTPManager", code: response.response?.statusCode ?? -10002, userInfo: [NSLocalizedDescriptionKey: "未知原因: 没有数据, 也没有错误原因: \(response)"])
                }
                compeleted(nil, error)
                
            }
        })
    }
 
}



/// 协议, 为了在一个方法里兼容 返回 Json(也就是字典) 和 Data(二进制数据)
protocol Serializable {
    func isSerializable() -> Bool
}

/// 默认实现
extension Serializable {
    func isSerializable() -> Bool {
        return true
    }
}

/// 遵守协议, 即可获得默认实现方法
extension Data: Serializable {
    
}

extension Dictionary: Serializable {
    
}

extension Array: Serializable {
    
}

extension HTTPManager {
    
    /// 判断网络类型
    static func  reachNetWork()-> Int {
    var num = 0
    let status = Reach().connectionStatus()
 
    switch status {
    case .unknown, .offline:
    num = 0
    case .online(.wwan):
    num = 4
    case .online(.wiFi):
    num = 1
    }
        return num
    }
    
    /// 判断是否有网络
    static func  isnetWorkBool()-> Bool {
        var num = 0
        let status = Reach().connectionStatus()
    
        switch status {
        case .unknown, .offline:
            num = 0
        case .online(.wwan):
            num = 4
        case .online(.wiFi):
            num = 1
        }
        if num != 0 {
            return true
        }else {
            return false
        }
    }
}

