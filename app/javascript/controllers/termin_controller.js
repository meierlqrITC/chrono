import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["beginn", "ende"]

  connect() {
    console.log("Termin-Controller ist da")
    this.checkAvailability = this.checkAvailability.bind(this)
    this.beginnTarget.addEventListener('change', this.checkAvailability)
    this.endeTarget.addEventListener('change', this.checkAvailability)
  }

  disconnect() {
    this.beginnTarget.removeEventListener('change', this.checkAvailability)
    this.endeTarget.removeEventListener('change', this.checkAvailability)
  }

  async checkAvailability() {
    const beginn = this.beginnTarget.value
    const ende = this.endeTarget.value

    if (beginn && ende) {
      const response = await fetch(`/termins/check?beginn=${beginn}&ende=${ende}`)
      const data = await response.json()

      if (data.exists) {
        this.showPopup(data.new_beginn, data.new_ende)
      }
    }
  }

  showPopup(newBeginn, newEnde) {
    const popup = document.createElement('div')
    popup.classList.add('ki-popup')
    popup.innerHTML = `
      <div class="ki-popup-content">
        <p id="message"></p>
        <div id="buttons" style="display: none;">
          <button id="accept" class="btn-accept">Vorschlag annehmen</button>
          <button id="reject" class="btn-reject">Ablehnen</button>
        </div>
      </div>
    `
    document.body.appendChild(popup)

    const message = `Oh, zu dem Zeitpunkt gibt es bereits einen Termin!
Die KI sucht einen Ersatztermin.......
Ersatztermin gefunden!
Wie wäre es mit:
Beginn: ${newBeginn}
Ende: ${newEnde}`

    this.typeMessage(message, () => {
      document.getElementById('buttons').style.display = 'block'
    })

    document.getElementById('accept').addEventListener('click', () => {
      this.beginnTarget.value = newBeginn
      this.endeTarget.value = newEnde
      document.body.removeChild(popup)
    })

    document.getElementById('reject').addEventListener('click', () => {
      document.body.removeChild(popup)
    })
  }

  typeMessage(message, callback) {
    const messageElement = document.getElementById('message')
    let index = 0

    function type() {
      if (index < message.length) {
        messageElement.innerHTML += message.charAt(index)
        index++
        setTimeout(type, 50)
      } else {
        callback()
      }
    }

    type()
  }
}
