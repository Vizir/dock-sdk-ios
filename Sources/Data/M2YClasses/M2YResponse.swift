//
//  M2YResponse.swift
//  Mobile2you
//
//  Created by Mobile2you Tecnologia on 25/09/2018.
//  Copyright © 2018 Mobile2You. All rights reserved.
//

/*
 Extension de response. Só meter nao fazer mais o
 Rmap e dar um response.parse dentro do sucesso.
 Ta bem bobinho mas da para fazer umas coisas legais
 nesse método (adicionar mais um escaping pro caso do 403, sei la).
 Pelo menos fica genérico para todas responses. no success
 desse metodo nao esquecer de fazer o mapeamento do data para a
 response como ta escrito ali no erro.
 */

import Moya
import EVReflection
import RxSwift

extension String {
  func replace(string:String, replacement:String) -> String {
      return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
  }

  func removeWhitespace() -> String {
      return self.replace(string: " ", replacement: "")
  }
    
    func determineErrorMessage(_ def: String) -> String {
        let dic: [String:String] = ["C0001":"Dados inválidos",
        "C0002":"Conta não encontrada",
        "C0003":"As senhas não conferem, verifique as informações e tente novamente",
        "C0004":"Problemas para atualizar a senha",
        "C0005":"Senha inválida",
        "C0006":"Problemas para validar a senha",
        "C0007":"Problemas para criar o cartão virtual",
        "C0008":"Erro ao obter a conta cartão",
        "C0009":"Conta inválida",
        "C0010":"Erro ao procurar a conta",
        "C0011":"Problemas ao obter a conta",
        "C0012":"Problemas para proceder com a requisição",
        "C0013":"Serviço indisponível",
        "C0014":"Erro ao gerar PDF",
        "C0015":"Valor do boleto inválido",
        "C0016":"Erro ao gerar ticket",
        "C0017":"Cartão inválido",
        "C0018":"Problemas para atualizar a senha do cartão",
        "C0019":"Problemas para cancelar o cartão",
        "C0020":"Cartão bloqueado",
        "C0021":"Senha do cartão inválida",
        "C0022":"Cartão não encontrado",
        "C0023":"Problemas para bloquear o cartão",
        "C0024":"Problemas para desbloquear cartão",
        "C0025":"Numero do cartão inválido",
        "C0026":"Erro ao obter os detalhes",
        "C0027":"Problemas para atualizar a senha do usuário",
        "C0028":"Problemas para efetuar o pagamento",
        "C0029":"Transação não autorizada",
        "C0030":"Código de barras inválida",
        "C0031":"Usuário não encontrado",
        "C0032":"Erro para criar usuário",
        "C0033":"Problemas para incluir dados na base",
        "C0034":"Cadastro não encontrado",
        "C0035":"Erro para criar pessoa na base",
        "C0036":"Erro para consultar dados",
        "C0037":"Erro ao obter o endereço",
        "C0038":"Tipo de imagem inválida",
        "C0039":"Pessoa não encontrada",
        "C0040":"Erro ao atualizar pessoa",
        "C0041":"Erro ao processar imagem",
        "C0042":"Erro ao atualizar selfie na base",
        "C0043":"Informações do cliente não encontrado",
        "C0044":"Problemas para confirmar recarga",
        "C0045":"Login inválido",
        "C0046":"Conta bloqueada, entre em contato com a central de atendimento",
        "C0047":"Usuário bloqueado",
        "C0048":"Usuário ou senha inválido",
        "C0049":"Problemas para processar a requisição",
        "C0050":"Nenhum registro encontrado para a requisição",
        "C0051":"Erro ao consultar cartão",
        "C0052":"Erro ao criar usuário",
        "C0053":"Token não pôde ser gerado",
        "C0054":"Erro ao enviar código por email",
        "C0055":"Erro ao verificar dados do usuário",
        "C0056":"Usuário já cadastrado",
        "C0057":"Erro ao consultar CPF",
        "C0058":"Problemas para gerar token",
        "C0059":"Token inválido",
        "C0060":"Erro na validação do token",
        "C0061":"Número de telefone inválido no cadastro",
        "C0062":"Cartão não existente ou não disponível para uso",
        "C0063":"Erro ao processar a requisição, verifique as informações e tente novamente",
        "C9997":"Não autorizado",
        "C9998":"Sessão expirada"]
        
        return dic[self] ?? def
    }
}

extension Response {
    func finalizeSession() {
        if let vc = M2YCDTEnvironment.shared.loginViewController {
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
    
    func parse(success: @escaping (Response)->(), error: @escaping (Int, String)->()) {
        if(M2YCDTEnvironment.shared.isDebug){
          print(statusCode)
          print(self.request?.httpMethod as Any)
          print(self.request?.url?.absoluteString as Any)
          print(self.request?.allHTTPHeaderFields as Any)
        }
        if (statusCode >= 200 && statusCode < 300) {
            // Pode ter bem mais checagens, da para customizar esse método inteiro
            var responseString = ""
            do {
                responseString = try self.mapString()
                if(M2YCDTEnvironment.shared.isDebug){
                  print(responseString)
                }
            } catch {

            }
            success(self)
        } else {
            
            var responseString = ""
            do {
                responseString = try self.mapString()
            } catch {
                responseString = "generic_error_message".localized
            }
            
            let data = responseString.data(using: .utf8)!
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String: Any]
                {
                    if(M2YCDTEnvironment.shared.isDebug){
                        print(json)
                    }
                    
                    var errorMessage = "generic_error_message".localized
                    var originalMessage = ""
                    
                    if json.keys.contains("codError") && json.keys.contains("message") {
                        originalMessage = json["message"] as! String
                        errorMessage = (json["codError"] as! String).determineErrorMessage(originalMessage)
                    }
                    
                    error(statusCode, errorMessage.localized)
                    if originalMessage.contains("expired") {
                        self.finalizeSession()
                    }
                } else {
                    error(statusCode, "generic_error_message".localized)
                }
            } catch let err as NSError {
                error(statusCode, "generic_error_message".localized)
            }
        }
    }
}
