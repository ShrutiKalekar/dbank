import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function () {
    // console.log("Working");
    update();
});

document.querySelector("form").addEventListener("submit", async function(){
    event.preventDefault();
    // console.log("Submitted");

    const button = event.target.querySelector("#submit-btn");

    const topupAmount = parseFloat(document.getElementById("topup-amount").value);
    const topdownAmount = parseFloat(document.getElementById("topdown-amount").value);
    // console.log(topdownAmount,topupAmount);

    button.setAttribute("disabled", true);

    if (topupAmount) {
        await dbank.topUp(topupAmount);
        document.getElementById("topup-amount").value = "";
    }

    if (topdownAmount) {
        await dbank.topDown(topdownAmount);
        document.getElementById("topdown-amount").value = "";
    }
    
    update();

    await dbank.compound();

    button.removeAttribute("disabled");
});

async function update() {
    const currAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = Math.round(currAmount*100)/100;
}