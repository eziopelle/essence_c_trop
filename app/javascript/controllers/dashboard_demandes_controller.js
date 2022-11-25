import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-demandes"
export default class extends Controller {
  static targets = ["tab", "notification"];

  connect() {
    console.log(this.notificationTargets)
  }

  changeTab(event) {
    event.preventDefault()
    const tabs = Array.from(this.tabTargets)
    tabs.forEach((tab) => {
      tab.classList.remove("active")
    })
    event.currentTarget.classList.add("active")
    console.log(event.currentTarget.innerHTML)

    // console.log(event.notificationTarget)
    const notifications = Array.from(this.notificationTargets)
    console.log(notifications)
    notifications.forEach((notification) => {

      notification.classList.add("d-none")
      if (event.currentTarget.innerHTML === "Acceptées") {
        if (notification.classList[1] === "accepted") {
          notification.classList.remove("d-none")
        }
      } else if (event.currentTarget.innerHTML === "Refusées") {
        if (notification.classList[1] === "declined") {
          notification.classList.remove("d-none")
        }
      } else if (event.currentTarget.innerHTML === "En attente") {
        if (notification.classList[1] === "pending") {
          notification.classList.remove("d-none")
        }
      } else {
          notification.classList.remove("d-none")
      }

    })
  }
}
