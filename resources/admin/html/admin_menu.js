window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.action === "openMenu") {
        document.getElementById("adminMenu").style.display = "block";
    }
});

function closeMenu() {
    document.getElementById("adminMenu").style.display = "none";

    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        }
    });
}

function spawnVehicle() {
    let vehicleName = prompt("Enter vehicle name:", "adder");

    if (vehicleName) {
        fetch(`https://${GetParentResourceName()}/spawnVehicle`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({ vehicleName: vehicleName })
        }).then(closeMenu);
    }
}
