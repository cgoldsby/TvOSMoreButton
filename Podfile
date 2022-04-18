# frozen_string_literal: true

platform :tvos, '10.0'

target 'UnitTests' do
  use_frameworks!
  pod 'SnapshotTesting', '~> 1.8.2'
  pod 'SwiftLint', '~> 0.27.0'
end

post_install do |installer|
  # This removes the warning about last conversion
  last_xcode_version_check = 1320 # Last check is Xcode 13.2
  installer.pods_project.root_object.attributes['LastSwiftMigration'] = last_xcode_version_check
  installer.pods_project.root_object.attributes['LastSwiftUpdateCheck'] = last_xcode_version_check
  installer.pods_project.root_object.attributes['LastUpgradeCheck'] = last_xcode_version_check

  shared_data_dir = Xcodeproj::XCScheme.user_data_dir(installer.pods_project.path)
  Dir["#{shared_data_dir}/*.xcscheme"].each do |scheme_path|
    scheme = Xcodeproj::XCScheme.new scheme_path
    scheme.doc.root.attributes['LastUpgradeVersion'] = last_xcode_version_check
    scheme.save!
  end
end
