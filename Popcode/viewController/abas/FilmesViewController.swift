//
//  FilmesViewController.swift
//  Popcode
//
//  Created by Jayme Antonio da Rosa Caironi on 06/03/21.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseUI

class FilmesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarFilme: UISearchBar!
    @IBOutlet weak var tableViewFilmes: UITableView!
    var firestore: Firestore!
    var auth: Auth!
    var filmes: [Dictionary<String, Any>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFilmes.separatorStyle = .none
        
        firestore = Firestore.firestore()
        auth = Auth.auth()
        self.searchBarFilme.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recuperarFilmes()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            recuperarFilmes()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let textoPesquisa = searchBar.text {
            if textoPesquisa != "" {
                pesquisarFilmes(texto: textoPesquisa)
            }
        }
    }
    
    func pesquisarFilmes(texto: String) {
        var listaFiltro: [Dictionary<String, Any>] = self.filmes
        self.filmes.removeAll()
        
        for item in listaFiltro {
            if let nome = item["nome"] as? String {
                if nome.lowercased().contains(texto.lowercased()){
                    self.filmes.append(item)
                }
            }
        }
        
        self.tableViewFilmes.reloadData()
    }
    
    /*Metodos para listagem na Tabela*/
    
    func recuperarFilmes() {
        
        //Limpar listagem de Filmes
        self.filmes.removeAll()
        self.tableViewFilmes.reloadData()
        
        firestore.collection("filmes").getDocuments { (snapshotResultado, erro) in
            
            if let snapshot = snapshotResultado {
                for document in snapshot.documents {
                    let dados = document.data()
                    self.filmes.append((dados))
                }
                self.tableViewFilmes.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaFilmes", for: indexPath) as! FilmesTableViewCell
        
        let indice = indexPath.row
        let filme = self.filmes[indice]
        
        let nome = filme["nome"] as? String
        if let url = filme["url"] as? String {
            celula.fotoFilme.sd_setImage(with: URL(string: url), completed: nil)
        let ano = filme["ano"] as? String
        let genero = filme["genero"] as? String
        let descricao = filme["descricao"] as? String
        }
        
        celula.nomeFilme.text = nome
        //celula.fotoFilme.image = UIImage(named: "A Chegada")
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableViewFilmes.deselectRow(at: indexPath, animated: true)
        
        let indice = indexPath.row
        let filme = self.filmes[indice]
        
        self.performSegue(withIdentifier: "segueDescrica", sender: filme)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueGaleria" {
            let viewDestino = segue.destination as! DescricaoViewController
            
            viewDestino.filmes = sender as? Dictionary
            
        }
        
        
        /*if segue.identifier == "segueDescricao" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let filmeSelecionado = self.filmes[ indexPath.row ]
                
        let viewDestino = segue.destination as! DescricaoViewController*/
                
            //viewDestino.filmes = sender as? Dictionary
            
            //}
        }
        
    

}
