# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
use_frameworks!

workspace 'ADNProject'

target 'Presentation' do

  project 'Presentation/Presentation.xcodeproj'

  # Pods for Presentation
  pod 'RealmSwift'
  pod 'Swinject'

  target 'PresentationTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PresentationUITests' do
    # Pods for testing
  end

end

target 'DataAccessLocal' do
 
  project 'DataAccessLocal/DataAccessLocal.xcodeproj'

  # Pods for DataAccessLocal
  pod 'RealmSwift'
 
  target 'DataAccessLocalTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Domain' do
 
  project 'Domain/Domain.xcodeproj'

  # Pods for Domain
 
  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end