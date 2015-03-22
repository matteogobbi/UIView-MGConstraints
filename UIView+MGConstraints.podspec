Pod::Spec.new do |s|
  s.name         = 'UIView+MGConstraints'
  s.version      = '1.1'
  s.summary      = 'Category which allows to store, remove and replace easily constraints.'
  s.homepage     = 'https://github.com/matteogobbi/UIView-MGConstraints'
  s.license      = { :type => 'MIT',
                     :file => 'LICENSE' }
  s.author       = { 'Matteo Gobbi' => 'job@matteogobbi.com' }
  s.source       = { :git => 'https://github.com/matteogobbi/UIView-MGConstraints.git',
                     :tag => '1.1' }
  s.platform     = :ios, '6.0'
  s.source_files = 'UIView+MGConstraints.{h,m}'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
end
