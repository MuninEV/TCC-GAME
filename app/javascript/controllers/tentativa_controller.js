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
    const a = this.element.querySelector(".message_tentativa")
    const tentativa =  JSON.parse(await response.text)

    if(response.ok){

        tentativa.data == null ?  a.innerHTML = tentativa.message :  Turbo.visit(`/tentativa/${tentativa.data.id}`)
        //retorna os dados após a criação da tentiva no backend
    }else{
      a.innerHTML = tentativa.message
    }
  }

}
