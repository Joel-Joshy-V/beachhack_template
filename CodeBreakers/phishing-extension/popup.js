document.getElementById("checkUrl").addEventListener("click", function () {
    let url = document.getElementById("urlInput").value.trim(); // Get input value

    if (!url) {
        document.getElementById("result").innerText = "⚠️ Please enter a URL!";
        return;
    }

    // Send the input URL to the Flask backend
    fetch("http://127.0.0.1:8080/predict", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ url: url }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.is_phishing == 1) {
            document.getElementById("result").innerText = "⚠️ Phishing Website!";
        } else {
            document.getElementById("result").innerText = "✅ Safe Website!";
        }
    })
    .catch(error => {
        document.getElementById("result").innerText = "Error connecting to server!";
        console.error("Error:", error);
    });
});
