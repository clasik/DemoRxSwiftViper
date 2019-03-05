platform :ios, '10.0'

source 'https://github.com/CocoaPods/Specs.git'

target 'DemoRxSwiftViper' do
    
    use_frameworks!
    
    # Rxswift
    pod 'RxSwift'
    pod 'RxCocoa'
    
    # Network
    pod 'Alamofire'
    pod 'RxAlamofire'
    pod 'AlamofireObjectMapper'
    pod 'Kingfisher'
    
    # Json Parse
    pod 'ObjectMapper'
    
    #Testing
    def testing_pods
        pod 'Quick'
        pod 'Nimble'
    end

    target 'DemoRxSwiftViperTests' do
        testing_pods
    end
    
    target 'DemoRxSwiftViperUITests' do
        testing_pods
    end

end

