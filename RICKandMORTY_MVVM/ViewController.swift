//
//  ViewController.swift
//  RICKandMORTY_MVVM
//
//  Created by Артем Вологдин on 08.02.24.
//

import UIKit


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var allCharactersTableView: UITableView!
    
    var heroes = [ResultsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        downloadJSON {
            self.allCharactersTableView.reloadData()
            print("OK")
        }
       
        allCharactersTableView.dataSource = self
        allCharactersTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalCell", for: indexPath) as! allCharactersTableViewCell
        cell.allCharactersName.text = heroes[indexPath.row].name
        cell.allCharactersGender.text = "(" + heroes[indexPath.row].species + ")"
        cell.allCharactersImage.contentMode = .scaleToFill

        let completeLink = heroes[indexPath.row].image
        cell.allCharactersImage?.downloaded(from: completeLink)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCharacter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CharacterViewController{
            destination.character = heroes[allCharactersTableView.indexPathForSelectedRow!.row]
        }
    }
    
    func downloadJSON(completed: @escaping() -> ()){
    let url = URL(string: "https://rickandmortyapi.com/api/character")
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if error == nil{
            do{
                let data = try JSONDecoder().decode(Hero.self, from: data!)
                self.heroes = data.results
            }catch{
                print(error)
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}

}

