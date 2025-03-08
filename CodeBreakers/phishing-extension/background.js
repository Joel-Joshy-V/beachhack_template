chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {
    if (changeInfo.status === "loading" && tab.url) {
        console.log("Checking URL:", tab.url);

        fetch("http://127.0.0.1:8080/predict", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ url: tab.url }),
        })
        .then(response => response.json())
        .then(data => {
            if (data.is_phishing == 1) {
                console.warn("Phishing detected! Redirecting...");
                chrome.tabs.update(tabId, { url: "chrome-extension://YOUR_EXTENSION_ID/warning.html" });
            }
        })
        .catch(error => console.error("Error checking phishing status:", error));
    }
});
