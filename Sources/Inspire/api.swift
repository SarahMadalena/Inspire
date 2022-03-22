import Foundation

struct Response: Decodable {
    var page: Int
    var per_page: Int
    var photos: [Photo]
}

struct Photo: Decodable {
    let src: SRC
}

struct SRC: Decodable {
    let original: String
    let medium: String
    let small: String
}



func api (theme: String) {
    
    let page = 1
    var req = URLRequest(url: URL(string: "https://api.pexels.com/v1/search/?page=\(page)&per_page=10&query=\(theme)")!)
    
    req.setValue("Bearer 563492ad6f91700001000001566d3b33051d498e8bdc9daaa23e45ff", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: req, completionHandler: { (data, response, error) in
        
// print(type(of: link.data(using: .utf8)!))
        
        let decoder = JSONDecoder()
        //        do { } catch { } ??
        do {
            let response = try decoder.decode(Response.self, from: data!)
            
            guard let selectedPhoto = response.photos.randomElement() else {
                print(response)
                exit(1)
                return
            }
            
            print(selectedPhoto.src.original)
            openG(url: selectedPhoto.src.original)
//condição de saida
            print("\n\n 📌 Aperte ENTER para sair do programa\n")
            
            let input = readLine()!
            
            if input == "" {
                exit(1)
            }
            
        } catch {
            print(error)
        }
        
        

    })
    
    task.resume()
    RunLoop.main.run()
}

@available(macOS 10.13, *)
func openG(url : String) {
    let ls = Process()
    ls.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    ls.arguments = [url]
    do{
      try ls.run()
    } catch {
        print(error.localizedDescription)
    }
}
