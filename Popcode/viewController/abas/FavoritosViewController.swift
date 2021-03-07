//
//  FavoritosViewController.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 04/03/21.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class FavoritosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableViewFavoritos: UITableView!
    var firestore: Firestore!
    var auth: Auth!
    var idUsuarioLogado: String!
    var storage: Storage!
    var usuario: Dictionary<String, Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
/*        storage = Storage.storage()
        firestore = Firestore.firestore()
        auth = Auth.auth() */
        
        
        
    }
    
    /*Métodos para listagem na tabela*/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaFavoritos", for: indexPath) as! FavoritosTableViewCell
        
        celula.nomeFilme.text = "Nome do Filme"
        celula.descricaoFilme.text = "Descrição do Filme"
        celula.anoFilme.text = "Ano do Filme"
        celula.fotoFilme.image = UIImage(named: "Popcode Logo")
        
        return celula
        
    }
    
/*    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    } */
    
}
