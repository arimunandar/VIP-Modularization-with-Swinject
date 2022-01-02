# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

workspace 'VIPDemo'
use_frameworks!

def project_pods
    pod 'Swinject'
end

target 'VIPDemo' do
  project_pods

  target 'VIPDemoTests' do
    inherit! :search_paths
  end

  target 'VIPDemoUITests' do
    # Pods for testing
  end

end

target 'VIPCore' do
    project 'Frameworks/VIPCore/VIPCore'
    inherit! :search_paths
    project_pods
end
  
target 'VIPFinance' do
    project 'Frameworks/VIPFinance/VIPFinance'
    inherit! :search_paths
    project_pods
end

target 'VIPFinanceApi' do
    project 'Frameworks/VIPFinanceApi/VIPFinanceApi'
    inherit! :search_paths
    project_pods
end

target 'VIPSocial' do
    project 'Frameworks/VIPSocial/VIPSocial'
    inherit! :search_paths
    project_pods
end

target 'VIPSocialApi' do
    project 'Frameworks/VIPSocialApi/VIPSocialApi'
    inherit! :search_paths
    project_pods
end
