import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // static targets = [ 'startDateInput', 'endDateInput' ]

  connect() {
    console.log("Coucou from Alert")
  }

  send(event){
    Swal.fire({
      icon: 'success',
      title: 'Chargement en cours de votre voiture...',
      showConfirmButton: false,
      timer: 1500
    })
  }

  accept_show(event){
    Swal.fire({
      icon: 'success',
      title: 'Votre demande de location est en cours, veuillez attendre la confirmation du locataire',
      showConfirmButton: false,
      timer: 15000
    })
  }
}
