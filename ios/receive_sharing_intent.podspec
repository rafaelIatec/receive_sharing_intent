#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'receive_sharing_intent'
  s.version          = '1.8.1'
  s.summary          = 'A flutter plugin that enables flutter apps to receive sharing photos from other apps.'
  s.description      = <<-DESC
A flutter plugin that enables flutter apps to receive sharing photos from other apps.
                       DESC
  s.homepage         = 'https://kasem.dev'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Kasem' => 'kasem.jaffer@gmail.com' }
  s.source           = { :path => '.' }
  s.ios.deployment_target = '12.0'

  s.swift_versions = ['5.0']

  # Por padrão, o Flutter usa o plugin completo (inclui a parte Flutter).
  s.default_subspecs = 'Flutter'

  # Código compartilhado com a Share Extension (não depende de Flutter).
  s.subspec 'ShareExtension' do |se|
    se.source_files = 'Classes/RSIConstants.swift', 'Classes/SharedMediaModels.swift', 'Classes/RSIShareViewController.swift'
    se.ios.deployment_target = '12.0'
    se.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
    }
  end

  # Parte do plugin Flutter (depende de Flutter). Mantida fora do subspec da extensão
  # para evitar que o target da extensão precise resolver/importar o módulo Flutter.
  s.subspec 'Flutter' do |fl|
    fl.source_files = 'Classes/ReceiveSharingIntentPlugin.{h,m}', 'Classes/SwiftReceiveSharingIntentPlugin.swift'
    fl.public_header_files = 'Classes/ReceiveSharingIntentPlugin.h'
    fl.dependency 'Flutter'
    fl.dependency 'receive_sharing_intent/ShareExtension'
    fl.ios.deployment_target = '12.0'
    fl.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
    }
  end
end

