# M2YPod
M2Y and Conductor pod

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/BatteryView.svg?style=flat)](http://cocoapods.org/pods/BatteryView)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)


## Requisitos

- iOS 8.0+
- Xcode 7.3


## Instalação

- Instale o M2YCocoaPods em seu computador:
```
- $ pod repo add M2YCocoaPods https://url.git 

 ```
- Adicione o source e o pod no Podfile (leia a sessão abaixo)
- Navegue até a pasta do projeto e rode:
```
$ pod install
```
- Se pedir a senha, peça ao responsável

### CocoaPods:

```ruby
source 'https://m2yvictorcatao@bitbucket.org/m2y/m2ycocoapods.git'

def myPods
  pod 'M2YPod'
  ...
end
```

### Atualizando:
- Rode:
```
$ pod repo add M2YCDT https://m2yvictorcatao@bitbucket.org/m2y/m2ycdt.git
```
- Clone o pod
- Faça o que for necessário no código
- Atualize o .podspec com a nova versão e mais o que for necessário
- Rode:
```
$ pod spec lint --allow-warnings
```
 - Se der tudo certo, rode:
```
$ pod repo push M2YCocoaPods M2YCDT.podspec --allow-warnings
```
- Feito!

[swift-image]:https://img.shields.io/badge/swift-4.2-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
