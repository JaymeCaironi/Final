//
//  DescricaoViewController.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 06/03/21.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseUI

class DescricaoViewController: UIViewController {
    
    var firestore: Firestore!
    var filmes: [Dictionary<String, Any>] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
/*        firestore = Firestore.firestore()

        let indice = index
        let filme = self.filmes[indice]
        
        let nome = filme["nome"] as? String
        let genero = filme["genero"] as? String
        let ano = filme["ano"] as? String 
        let descricao = filme["descricao"] as? String
        if let url = filme["url"] as? String {
            fotoFilme.sd_setImage(with: URL(string: url), completed: nil) */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDescricao" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let filmeSelecionado = self.filmes[ indexPath.row ]
                
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController
                viewControllerDestino.filme = filmeSelecionado
                
            }
        }
        
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
