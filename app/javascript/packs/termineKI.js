document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");
    console.log("JS geladen");

    if (form) {
        form.addEventListener("change", function() {
            const startDate = document.querySelector("#termin_beginn_1i").value + "-" +
                document.querySelector("#termin_beginn_2i").value + "-" +
                document.querySelector("#termin_beginn_3i").value + " " +
                document.querySelector("#termin_beginn_4i").value + ":" +
                document.querySelector("#termin_beginn_5i").value;
            const endDate = document.querySelector("#termin_ende_1i").value + "-" +
                document.querySelector("#termin_ende_2i").value + "-" +
                document.querySelector("#termin_ende_3i").value + " " +
                document.querySelector("#termin_ende_4i").value + ":" +
                document.querySelector("#termin_ende_5i").value;
            const veranstaltungId = document.querySelector("#termin_veranstaltung_id").value;

            if (startDate && endDate && veranstaltungId) {
                checkTermin(startDate, endDate, veranstaltungId);
            }
        });

        async function checkTermin(startDate, endDate, veranstaltungId) {
            const response = await fetch("/termins/check", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
                },
                body: JSON.stringify({
                    beginn: startDate,
                    ende: endDate,
                    veranstaltung_id: veranstaltungId
                })
            });

            const result = await response.json();

            if (result.exists) {
                showKIPopup();
            }
        }

        function showKIPopup() {
            const popup = document.createElement("div");
            popup.className = "ki-popup";
            popup.innerHTML = `
        <div class="ki-popup-content">
          <p>Künstliche Intelligenz sucht nach einem besseren Termin...</p>
          <p id="ki-output"></p>
        </div>
      `;

            document.body.appendChild(popup);
            simulateKIGeneration();
        }

        function simulateKIGeneration() {
            const text = "Neuer Termin Vorschlag: 2023-12-01 10:00 - 2023-12-01 12:00";
            const output = document.getElementById("ki-output");
            let i = 0;

            const interval = setInterval(() => {
                if (i < text.length) {
                    output.innerHTML += text.charAt(i);
                    i++;
                } else {
                    clearInterval(interval);
                }
            }, 100);
        }
    }
});
