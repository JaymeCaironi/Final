//
//  CadastroViewController.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 04/03/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CadastroViewController: UIViewController {


    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    var auth: Auth!
    var firestore: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        auth = Auth.auth()
        firestore = Firestore.firestore()
        
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        
        if let nome = campoNome.text {
            if let email = campoEmail.text {
                if let senha = campoSenha.text {
                    
                    auth.createUser(withEmail: email, password: senha) { (dadosResultado, erro) in
                        if erro == nil {
                            
                            if let idUsuario = dadosResultado?.user.uid {
                                //salvar dados do usuario
                                self.firestore.collection("usuarios").document( idUsuario ).setData(["nome": nome, "email": email])
                            }
                            
                            print("Usuario cadastrado com Sucesso")
                        }else{
                            print("Erro ao cadastrar Usuario")
                        }
                    }
                }else{
                    print("Digite seu Senha")
                }
            }else{
                print("Digite seu Email")
            }
        }else{
            print("Digite seu Nome")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
