function kickPlayer() {
    let playerId = prompt("Enter the player ID to kick:");
    let reason = prompt("Enter the reason for kicking:");
    fetch(`https://${GetParentResourceName()}/admin:kickPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            target: playerId,
            reason: reason
        })
    });
}

function banPlayer() {
    let playerId = prompt("Enter the player ID to ban:");
    let reason = prompt("Enter the reason for banning:");
    fetch(`https://${GetParentResourceName()}/admin:banPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            target: playerId,
            reason: reason
        })
    });
}

function healPlayer() {
    let playerId = prompt("Enter the player ID to heal:");
    fetch(`https://${GetParentResourceName()}/admin:healPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            target: playerId
        })
    });
}

function killPlayer() {
    let playerId = prompt("Enter the player ID to kill:");
    fetch(`https://${GetParentResourceName()}/admin:killPlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            target: playerId
        })
    });
}

function spawnVehicle() {
    let vehicleName = prompt("Enter the vehicle name to spawn:");
    fetch(`https://${GetParentResourceName()}/admin:spawnVehicle`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            vehicleName: vehicleName
        })
    });
}

function deleteVehicle() {
    fetch(`https://${GetParentResourceName()}/admin:deleteVehicle`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        }
    });
}

function spectatePlayer() {
    let playerId = prompt("Enter the player ID to spectate:");
    fetch(`https://${GetParentResourceName()}/admin:spectatePlayer`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            target: playerId
        })
    });
}

function closeMenu() {
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        }
    }).then(() => {
        document.getElementById("adminMenu").style.display = "none";
    });
}
