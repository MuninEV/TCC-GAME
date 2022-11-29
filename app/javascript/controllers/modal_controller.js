import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"


//implementa lógica do modal na pagina de login e cadastro
export default class extends Controller {
  connect() {
   this.modal = new Modal(this.element)

   //abre o modal
   this.modal.show()
  }

  fechar(){

    //fecha o modal
    this.modal.hide()
  }
}
