import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"
import { FetchRequest } from "@rails/request.js"


export default class extends Controller {

  connect() {
    console.log('aqui')
  }

 async criar(event){
    event.preventDefault()

    //faz uma requisição ao backend para criar uma tentiva
    const request = new FetchRequest('post', '/tentativa')

    //gera a ação de request
    const response = await request.perform()
    
    if(response.ok){

        //retorna os dados após a criação da tentiva no backend
        const tentativa = JSON.parse(await response.text)
        Turbo.visit(`/tentativa/${tentativa.data.id}`)
    }
  }

}
