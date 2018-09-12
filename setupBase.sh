if [ $# -eq 0 ]
 then	
   echo "You must enter the project filename as an argument like so ./setupBase ProjectName"
   exit
fi
# setup git
git init
wget https://raw.githubusercontent.com/github/gitignore/master/Swift.gitignore > .gitignore
# setup podfile

echo "# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target $1 do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for $1
  pod 'Firebase'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'SVProgressHUD'
  pod 'ChameleonFramework'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end" > Podfile

echo "-----------------------------\n"
echo "Remember you need to create the new XCode project within this folder and then you must run the command pod init and pod install"
