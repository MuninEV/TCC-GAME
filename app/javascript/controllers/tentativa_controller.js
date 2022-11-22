import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"
import { FetchRequest } from "@rails/request.js"


export default class extends Controller {
  connect() {
    console.log('caiu aqui')
  }

 async criar(event){
    event.preventDefault()
    const request = new FetchRequest('post', '/tentativa')
    const response = await request.perform()
    
    if(response.ok){
        const tentativa = JSON.parse(await response.text)
        Turbo.visit(`/tentativa/${tentativa.data.id}`)
    }
  }
}
